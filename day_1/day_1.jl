### A Pluto.jl notebook ###
# v0.17.2

using Markdown
using InteractiveUtils

# ╔═╡ 1f2d91e2-2977-4541-941d-f11163ef1408
# parse - https://docs.julialang.org/en/v1/base/numbers/#Base.parse
# readlines - https://docs.julialang.org/en/v1/base/io-network/#Base.readlines
# broadcasting - https://docs.julialang.org/en/v1/manual/arrays/#Broadcasting

# broadcast (.) the parse function to the Array{String}
# to create an Array{Int64}
depths = parse.(Int, readlines("./submarine_depths.txt"))

# ╔═╡ 6632ae96-5494-4e5b-94bb-e92a4b2b22e9
typeof(depths)

# ╔═╡ 4cf11f16-dd69-4268-b04f-5e1f68dde62a
# 1. Measurements larger than previous

# Do-block syntax - https://docs.julialang.org/en/v1/manual/functions/#Do-Block-Syntax-for-Function-Arguments

sum(1:length(depths) - 1) do i
	depths[i + 1] > depths[i]
end

# ╔═╡ 93c6e318-6a92-433e-86cc-bf16d1415739
# 2. Sliding window
count(3:lastindex(depths) -1) do idx
	depths[idx - 2] < depths[idx + 1]
end

# ╔═╡ Cell order:
# ╠═1f2d91e2-2977-4541-941d-f11163ef1408
# ╠═6632ae96-5494-4e5b-94bb-e92a4b2b22e9
# ╠═4cf11f16-dd69-4268-b04f-5e1f68dde62a
# ╠═93c6e318-6a92-433e-86cc-bf16d1415739
