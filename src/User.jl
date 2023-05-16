module User

import Reexport: @reexport


@reeexport using CodeTracking,
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

export c, t, s, d

macro c(expr)
    :(clipboard($(expr)))
end

macro c()
    :(clipboard($(ans)))
end

macro t(expr)
    :(typeof($(expr)))
end

macro t()
    :(typeof($(ans)))
end

macro s(expr)
    :(size($(ex)))
end

macro s()
    :(size($(ans)))
end

macro d(expr)
    :(Docs.doc($(expr)))
end

macro d()
    :(Docs.doc($(ans)))
end

end # module User
