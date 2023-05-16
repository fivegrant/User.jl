module Macros

export c, t, s, d

#Macros from https://github.com/anandijain/Startup.jl
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

end # module Macros
