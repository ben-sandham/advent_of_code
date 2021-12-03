### A Pluto.jl notebook ###
# v0.17.2

using Markdown
using InteractiveUtils

# ╔═╡ 04114e1f-bc53-4468-854b-7bbd9241f99c
begin
	# Submarine movements
	movements = [split(el, " ") for el in readlines("sub_movement.txt")]
	direction = getindex.(movements,1)
	# Use "dot call" syntax
	amounts = parse.(Int, getindex.(movements,2))
end

# ╔═╡ b9a7a50e-97a8-477b-ba28-688455aba7af
# functions - https://docs.julialang.org/en/v1/manual/functions/#man-functions
# short-circuit evaluation (&&) - https://docs.julialang.org/en/v1/manual/functions/#man-functions
function position(direction, amount)
	horizontal = 0
	vertical = 0

	for (direction, amount) in zip(direction, amount)
		# In the expression a && b, the subexpression b is 
		# only evaluated if a evaluates to true
		direction == "forward" && (horizontal += amount)
		direction == "down" && (vertical += amount)
		direction == "up" && (vertical -= amount)
	end

	return (horizontal, vertical)
end

# ╔═╡ eb661034-0151-450a-91b7-2cc6d59803da
prod(position(direction, amounts))

# ╔═╡ 781c9b14-fbbb-4fc0-af24-807c2f13f091
function position_aim_adj(direction, amount)
	horizontal = 0
	vertical = 0
	aim = 0

	for (direction, amount) in zip(direction, amount)
		if direction == "forward"
			horizontal += amount
			vertical = vertical + (aim * amount)
		end
		direction == "down" && (aim += amount)
		direction == "up" && (aim -= amount)
	end

	return (horizontal, vertical)
end

# ╔═╡ 86957d7a-1dd8-4b0e-8dbe-2c4ef321536c
prod(position_aim_adj(direction, amounts))

# ╔═╡ Cell order:
# ╠═04114e1f-bc53-4468-854b-7bbd9241f99c
# ╠═b9a7a50e-97a8-477b-ba28-688455aba7af
# ╠═eb661034-0151-450a-91b7-2cc6d59803da
# ╠═781c9b14-fbbb-4fc0-af24-807c2f13f091
# ╠═86957d7a-1dd8-4b0e-8dbe-2c4ef321536c
