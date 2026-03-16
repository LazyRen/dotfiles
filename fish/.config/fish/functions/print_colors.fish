function print_colors --description "Show all named terminal colors"
    set -l colors black red green yellow blue purple cyan white
    set -l codes 30 31 32 33 34 35 36 37
    set -l bright_codes 90 91 92 93 94 95 96 97

    for i in (seq (count $colors))
        printf "\033[%sm%-15s\033[0m \033[1;%sm%-15s\033[0m\n" \
            $codes[$i] $colors[$i] \
            $codes[$i] "$colors[$i] bold"
    end
    for i in (seq (count $colors))
        printf "\033[%sm%-15s\033[0m \033[1;%sm%-15s\033[0m\n" \
            $bright_codes[$i] "bright-$colors[$i]" \
            $bright_codes[$i] "bright-$colors[$i] bold"
    end
end
