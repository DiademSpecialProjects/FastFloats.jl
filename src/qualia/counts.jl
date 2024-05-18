# concrete counts

CountValues(x::BinaryFloat{W,P}) where {W,P} = CountValues(typeof(x))
CountExponents(x::BinaryFloat{W,P}) where {W,P} = CountExponents(typeof(x))
CountSignificands(x::BinaryFloat{W,P}) where {W,P} = CountSignificands(typeof(x))

"""
    CountSigns(x::BinaryFloat{W,P})

- counts 1 for UnsignedFLOATs
- counts 2 for SignedFLOATs
"""
CountSigns

"""
    CountNumericValues(x::BinaryFloat{W,P})

counts the distinct values of x ignoring NaN
- the number of numeric value encodings
"""
CountNumericValues

"""
    CountFiniteValues(x::BinaryFloat{W,P})

counts the distinct values of x ignoring Infs, NaN
- the number of finite value encodings
"""
CountFiniteValues

"""
    CountOrdinaryValues(x::BinaryFloat{W,P})

counts the distinct values of x ignoring Infs, NaN, Zero
- the number of ordinary value encodings
"""
CountOrdinaryValues

"""
    CountSpecialValues(x::BinaryFloat{W,P})

counts Zero, NaN, Infs
"""
CountSpecialValues

CountSigns(x::UnsignedFLOAT{W,P}) where {W,P} = 1
CountSigns(x::SignedFLOAT{W,P}) where {W,P} = 2

CountSpecialValues(x::UnsignedFLOAT{W,P}) where {W,P} =
    1 + nan(x) + inf(x) # Zero is Special and omnipresent

CountSpecialValues(x::SignedFLOAT{W,P}) where {W,P} =
    1 + nan(x) + 2inf(x) # Zero is Special and omnipresent

CountNumericValues(x::SignedFLOAT{W,P}) where {W,P} =
    CountValues(x) - nan(x)

CountNumericValues(x::UnsignedFLOAT{W,P}) where {W,P} =
    CountValues(x) - nan(x)

CountFiniteValues(x::UnsignedFLOAT{W,P}) where {W,P} =
    CountNumericValues(x) - inf(x)

CountFiniteValues(x::SignedFLOAT{W,P}) where {W,P} =
    CountNumericValues(x) - 2inf(x)

CountOrdinaryValues(x::BinaryFloat{W,P}) where {W,P} =
    CountFiniteValues(x) - 1 # Zero is Special, not Ordinary

CountOrdinaryMagnitudes(x::SignedFLOAT{W,P}) where {W,P} =
    CountOrdinaryValues(x) >> 1

CountOrdinaryMagnitudes(x::UnsignedFLOAT{W,P}) where {W,P} =
    CountOrdinaryValues(x)

