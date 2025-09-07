function Save_Data!(n, t, r, strideT, strideR, Nr,
                    phi1)
    if n % strideT == 0
        open("data/phi1.t", "a") do io
            write(io, "$(t)\t$(phi1[begin])\n")
        end # del do

        open("data/phi1.rt", "a") do io
            for j in 1:strideR:Nr
                write(io, "$(t)\t$(r[j])\t$(phi1[j])\n")
            end # del for
            write(io, "\n")
        end # del do
    end
    return nothing
end

