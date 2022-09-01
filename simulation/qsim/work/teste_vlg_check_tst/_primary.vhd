library verilog;
use verilog.vl_types.all;
entity teste_vlg_check_tst is
    port(
        Cout            : in     vl_logic_vector(1 downto 0);
        S               : in     vl_logic_vector(1 downto 0);
        sampler_rx      : in     vl_logic
    );
end teste_vlg_check_tst;
