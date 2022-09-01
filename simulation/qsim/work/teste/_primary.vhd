library verilog;
use verilog.vl_types.all;
entity teste is
    port(
        A               : in     vl_logic_vector(1 downto 0);
        B               : in     vl_logic_vector(1 downto 0);
        Cin             : in     vl_logic;
        S               : out    vl_logic_vector(1 downto 0);
        Cout            : out    vl_logic_vector(1 downto 0)
    );
end teste;
