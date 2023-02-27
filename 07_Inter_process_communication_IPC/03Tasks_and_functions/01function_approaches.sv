module function_typedef(
);
    typedef enum  {IDLE,WAIT,LOAD,STORE} states_t;
    states_t st_p,st_n;

    function states_t get_next(states_t inp_state);
        case (inp_state)
            WAIT:get_next=LOAD;
            LOAD:get_next=STORE;
            STORE:get_next=WAIT;
            default:get_next=inp_state; //default state
        endcase
    endfunction

    initial begin
        st_p=LOAD;
        st_n=get_next(st_p);
        $display("st_n=[%0s]",st_n);
    end
endmodule