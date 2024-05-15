module FastFloats

export BinaryFloat, SignedFloat, UnsignedFloat

using BitOperations                     # bitfields: mask, shift, unmask
using BitIntegers, Quadmath             # Rational{Int1024}, Float128
using Printf                            # hexadecimal strings
using CSV, Tables, DataFrames           # tables in memory and in files

include("type/abstraction.jl")
include("type/realization.jl")

include("qualia/counts.jl")
include("qualia/tallys.jl")
include("qualia/extrema.jl")
include("qualia/magnitudes.jl")

include("provide/values.jl")
include("provide/tables.jl")

end  # DesignerFloats
