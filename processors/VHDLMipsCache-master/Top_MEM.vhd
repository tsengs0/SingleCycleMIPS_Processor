----------------------------------------------------------------------------------
-- Company: Insight Corp.
-- Engineer: Marcelo Linck
-- 
-- Create Date:    19:40:44 05/25/2011 
-- Module Name:    Top_MEM - MEM 
-- Project Name: 	 MR4_cache
-- Description: internal architecture of a hierarchy cache memory
-- with direct mapping.
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: The top of the top. Bitches Dig Top...less...
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.CachePackage.ALL;

entity Top_MEM is
	port(
		clk,reset:						in STD_LOGIC; --dããã
		addr:								in reg32; --equivale ao PC
		ce_n,we_n,oe_n: 			in STD_LOGIC; --ce, we, oe
		data_in:							in reg32; --recebe instrução da Memória Principal
		data_out:						out reg32; --instructição para memória principal
		hold:								out STD_LOGIC --stall
	);
end Top_MEM;

architecture MEM of Top_MEM is
signal L2_L1: reg128; -- connect L2 with L1
signal MP_L2: reg32;  -- connect MP WITH l2
-- auxiliary signals
signal L1_data,MP_data,MP_address,L2_address,L1_address: reg32; --Passa o endereço para as caches e memória principal.
signal L1_ce_n, L1_we_n, L1_oe_n, L1_hit: STD_LOGIC; --Escrita, leitura e hit de L1
signal L2_ce_n, L2_we_n, L2_oe_n, L2_hit: STD_LOGIC; --Escrita, hit e leitura de L2
signal MP_ce_n,MP_we_n,MP_oe_n: STD_LOGIC; --Escrita hit e leitura da Memória principal
signal MAST : type_state; --A máquina de estados é definida no top caches
signal L2wait: integer range 0 to WAIT_L2-1; --Verifica se está pronta para enviar dados à L1
signal MPwait: integer range 0 to WAIT_MP-1; --Verifica se está pronta para enviar dados à L2
signal Isend,aux_address: reg32 := (others=>'0'); --Isend: conta se foram carregadas 8 instruções em L2
--aux_address: L2 recebe endereço da memória principal por esse sinal
begin

	-- L1 cache
	L1: entity work.L1_cache
		 generic map ( START_A => x"00400000" ) --Começa com o endereço inicial padrão
		 port map (
			address => L1_address, --Recebe o endereço do processador
			data => L1_data, --Recebe os dados do processador
			block_L2 => L2_L1, --Recebe os dados de L2
			ce_n => L1_ce_n, 
			we_n => L1_we_n,
			oe_n => L1_oe_n, --Passa os sinais de escrita e leitura do processador
			hit => L1_hit --Passa o hit
		);
		
	-- L2 cache
	L2: entity work.L2_cache
		 generic map ( START_A => x"00400000" ) --Começa com o endereço inicial padrão
		 port map (
			address => L2_address, --Recebe o endereço de L1
			Block_L1 => L2_L1, --Passa os dados para L1
			block_MP => MP_L2, --Recebe os dados da memória principal
			ce_n => L2_ce_n,
			we_n => L2_we_n,
			oe_n => L2_oe_n, --Passa os sinais de escrita e leitura do processador
			hit => L2_hit --Passa o hit
		);
		
	MP: entity work.MP
       generic map( START_ADDRESS => x"00400000" )
       port map (
			ce_n=>MP_ce_n, 
			we_n=>MP_we_n, 
			oe_n=>MP_oe_n, --Passa os sinais de escrita e leitura do processador
			address=>MP_address, --A memória principal recebe o endereço de L2
			data=>MP_data --Recebe os dados do processador
		);
		
        
		MP_data <= data_in; --Recebe os dados do processador
		
		MP_L2 <= (others=>'Z') when MAST = TMEMO else MP_data; --Quando se inicia o programa L2 não recebe nada da memória princiapal, senão L2 recebe o que está na memória principal
		
		data_out <= L1_data; --Ao final o dado sai de L1 para o processador, pois ela está no nível superior
		
		
		-- hold processor
		hold <= '0' when MAST = SL1 and L1_hit = '1' else '1'; --Se o processador estiver lendo a L1 e L1 deu hit não "tranca" e a cache pode passa a memória, senão "tranca" até que L1 tenha armazenado o endereço correto
		
		-- address connect direct 
		L1_address <= addr; --L1 recebe o endereço de PC
		L2_address <= aux_address when MAST = WMP or MAST = SMP else addr ; --L2 recebe o endereço auxiliar quando o dado estiver na memória principal ou em L2, senão recebe do PC
		MP_address <= addr when MAST = TMEMO else aux_address; --Se o endereço estiver na memória principal ela tem o mesmo endereço de PC, senão ela recebe um endereço auxiliar
		
		aux_address <= addr(31 downto 4) & "0000" + Isend;	--O endereço auxiliar recebe o endereço de PC + 0000 + 8 instruções da memória principal 
		
		-- L1 control
		L1_ce_n <= '0' when MAST = SL1 or MAST = WL2 or MAST = WBL1 else '1'; --Desabilita o ce quando o processador estiver lendo L1 ou L2 estiver sendo escrita
		L1_oe_n <= '0' when MAST = SL1 or MAST = WBL1 else '1'; --Esse sinal bizzaro está inativo quando o processador estiver lendo L1
		L1_we_n <= '0' when MAST = WL2 else '1'; --L1 não pode escrever se o dado estiver sendo escrito em L2
		
		-- L2 control
		L2_ce_n <= '0' when MAST = WL2 or MAST = WMP else '1'; --Desabilita o ce quando estiver escrevendo L2 ou lendo/pegando o dado da memória principal
		L2_oe_n <= '0' when MAST = WL2 else '1'; --Esse sinal bizzaro está inativo quando o processador estiver lendo L2
		L2_we_n <= '0' when MAST = WMP else '1'; --L2 não pode escrever se o dado estiver na memória principal
		
		-- MP control
		MP_ce_n <= '0' when MAST = WMP or MAST = SMP else --Desabilita o ce se a memória principal está passando para L2
					  ce_n when MAST = TMEMO --Quando se inicia o programa a memória principal tem o mesmo sinal de leitura do processador
					  else '1'; 
		MP_oe_n <= '0' when MAST = WMP or MAST = SMP else '1'; --Se a memória principal está passando para L2 desativa o sinal bizarro
		MP_we_n <= we_n when MAST = TMEMO else '1'; --Quando se inicia o programa a memória principal tem o mesmo sinal de escrita do processador
		
		
		process(MAST,clk,reset)
		begin
		 if(reset = '1') then
			-- loading instruction memory
			MAST <= TMEMO; --Iniciando o programa
		 elsif(rising_edge(clk)) then --Se clock = '1'
			case MAST is 
		 
				when TMEMO =>
						-- memory is ready
						MAST <= SL1;  --Na primeira borda de subida após o reset lê a L1
						
					
				when SL1 =>
					if L1_hit = '0' then --Se deu miss na L1
						-- instruction in L1
						-- go back and hold = '0' --Se a instrução estiver em L1(L1_hit = '1') volta e "destrava" o processador
						if WriteBack ='1' then
							MAST <= WBL1;
						else
							MAST <= SL2; --Lê a L2
					end if;
				
				when WBL1 =>
					if WriteBack = '0' then 
						MAST <= SL1;
					end if;
				
				when SL2 =>
					if L2_hit = '1' then --Se deu hit na L2
						-- instruction in L2
						-- wait for L2
						MAST <= WL2; --Pega a instrução de L2
					else 
						L2wait <= 0; -- L2 está pronta para ser escrita
						MAST <= SMP; -- OK, the instruction is in MP!
					end if;
				
				when SMP =>
					if Isend = 32 then --Se forem passadas 8 instruções para L2
						-- L2 loaded!
						Isend <= (others=>'0'); --Passou as instruções, portanto zera Isend
						MAST <= WL2; --Espera por L2
					else 
						MPwait <= 0; --Memória principal está pronta para enviar os dados
						MAST <= WMP; -- there're more instructions --Falta passar instruções
					end if;
					
				when WL2 =>
					-- L2 ready to write
					if(L2wait = WAIT_L2) then MAST <= SL1; --Se L2 está pronta para escrever, escreve em L1
					else L2wait <= L2wait + 1; -- wait for L2 
					end if;
				
				when WMP =>
					-- MP ready to write
					if(MPwait = WAIT_MP) then
						Isend <= Isend + 4; -- one more instruction --Passa mais uma instrução para L2
						MAST <= SMP; --Vê se acabou de passar todas as instruções para L2
					else MPwait <= MPwait + 1; --Espera pela memória principal
					end if;
			end case;
		end if;
	end process;
	
end MEM;
