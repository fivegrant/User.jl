module REPLBuild

import PackageCompiler: create_sysimage
export compile

function gen_precompile(modules::AbstractArray, extra_statements::AbstractArray{Expr} = [])
    imports = [:(using $(Symbol(name))) for name in modules]
    startup = Expr(:block, imports..., :(1+1), extra_statements...)
    filehandle = tempname()
    write(filehandle, string(startup))
    filehandle
end


function gen_startup(modules::AbstractArray, extra_statements::AbstractArray = [])
    imports = [:(using $(Symbol(name))) for name in modules]
    startup = Expr(:block, imports..., extra_statements...)
    filehandle = tempname()
    write(filehandle, string(startup))
    filehandle
end


function compile(modules, execution=[], statements=[], filehandle="sysimage.so")
    #colorscheme!("GruvboxDark")
    create_sysimage(
        modules; 
        incremental=true,
        sysimage_path=filehandle, 
        precompile_execution_file=gen_precompile(modules, execution), 
        precompile_statements_file=gen_startup(modules, statements)
    )
end

end # module User
