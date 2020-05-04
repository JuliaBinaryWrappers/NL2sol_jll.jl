# Autogenerated wrapper script for NL2sol_jll for i686-w64-mingw32-libgfortran3
export libnl2sol

using CompilerSupportLibraries_jll
## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "PATH"

# Relative path to `libnl2sol`
const libnl2sol_splitpath = ["bin", "libnl2sol.dll"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libnl2sol_path = ""

# libnl2sol-specific global declaration
# This will be filled out by __init__()
libnl2sol_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libnl2sol = "libnl2sol.dll"


"""
Open all libraries
"""
function __init__()
    global artifact_dir = abspath(artifact"NL2sol")

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    # We first need to add to LIBPATH_list the libraries provided by Julia
    append!(LIBPATH_list, [Sys.BINDIR, joinpath(Sys.BINDIR, Base.LIBDIR, "julia"), joinpath(Sys.BINDIR, Base.LIBDIR)])
    # From the list of our dependencies, generate a tuple of all the PATH and LIBPATH lists,
    # then append them to our own.
    foreach(p -> append!(PATH_list, p), (CompilerSupportLibraries_jll.PATH_list,))
    foreach(p -> append!(LIBPATH_list, p), (CompilerSupportLibraries_jll.LIBPATH_list,))

    global libnl2sol_path = normpath(joinpath(artifact_dir, libnl2sol_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libnl2sol_handle = dlopen(libnl2sol_path)
    push!(LIBPATH_list, dirname(libnl2sol_path))

    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ';')
    global LIBPATH = join(LIBPATH_list, ';')

    # Add each element of LIBPATH to our DL_LOAD_PATH (necessary on platforms
    # that don't honor our "already opened" trick)
    #for lp in LIBPATH_list
    #    push!(DL_LOAD_PATH, lp)
    #end
end  # __init__()

