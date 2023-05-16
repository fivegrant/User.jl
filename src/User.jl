module User

function __init__()
    atreplinit() do repl
    @eval begin
        using OhMyRepl
        colorscheme!("GruvboxDark")
        using CodeTracking,
              Debugger,
              DefaultApplication,
              Downloads,
              ImageInTerminal,
              Images,
              Latexify,
              OhMyREPL,
              PrecompileTools,
              ProgressMeter,
              Revise,
              TerminalPager
    end
    end
end

end # module User
