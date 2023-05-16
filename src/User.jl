module User

include("./Macros.jl")


function __init__()
    atreplinit() do repl
    @eval begin
        import Pkg
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
        using Macros
    end
    end
end

end # module User
