### A Pluto.jl notebook ###
# v0.14.0

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : missing
        el
    end
end

# ╔═╡ f86d78d7-5ef7-4179-9dd5-667ab3f63721
begin
	import Pkg
	Pkg.add("PlutoUI")
	using PlutoUI
end

# ╔═╡ f8f382b0-96d9-11eb-051d-a7a73c6f14ae
md" # _Data Strucutres in Julia_

## Dictionaires


Dictionaries are data related to one another

"

# ╔═╡ 57382cd3-67e0-4680-ae4b-ca7733ad1fc3
phonebook = Dict("Jenny" => "867-5309", "Ghostbusters" => "555-2368")

# ╔═╡ 23d4273b-2641-4bc0-ab04-92a8d0a9a88e
phonebook["Carlos"] = "323-151-76-40"

# ╔═╡ d958682d-5d67-4586-96a3-0502933e0860
split(phonebook["Carlos"], "-")


# ╔═╡ 3ef156e9-95cf-4e26-8579-8616c4243ede
carlos_number = pop!(phonebook, "Carlos")

# ╔═╡ 13811c84-7941-485e-8a34-38852c794c61
phonebook

# ╔═╡ 38554e79-11c9-45f7-b551-03d9c352b7b0
carlos_number

# ╔═╡ 26e17e09-60e0-4827-8750-74effa29883c
favorite_animals = ("cats", "low intelect humans", "Ramses")

# ╔═╡ 8151c6bd-2f6d-4da5-b152-cc212010ede7
favorite_animals[1]

# ╔═╡ cd4ff83c-cdac-44ea-9808-ffddc928f1f9
favorite_animals[1] = "rooster"

# ╔═╡ c21bfc5a-f7eb-4fe1-b71a-b6fe09ad7af6
begin
	friends = ["Kevin", "Yessy", "Manuel"]
	
	total =length(friends)
end

# ╔═╡ 69551771-143e-4928-aa8c-47153a2f1f6c
@bind friend Slider(1: total, show_value=true)

# ╔═╡ 2695f753-53e8-4fd0-b0cb-3f343f718229
friends[friend]

# ╔═╡ 2e8779a3-130b-492d-ae6d-63a0d5f5e1f1
my_array = rand(10, 8)

# ╔═╡ bd5e6cd3-7c8a-4367-b6f8-18e97d6091c1
size(my_array)[1]

# ╔═╡ be564529-0fe7-475a-ad77-0b92eb7d16a8
my_array[1,1,1]

# ╔═╡ 2dac8620-7a3a-4097-b4fc-452a7aefa15b
md"#### Select Row"

# ╔═╡ 9f981dd9-8ad3-4502-8696-f94ec2d49d5f
begin
	@bind row RangeSlider(1: size(my_array)[1], show_value=true)
end

# ╔═╡ 9f854b75-9cc7-4d6b-b64b-d82306fa13fd
md"#### Select Column"

# ╔═╡ a6ce5c01-eb44-4026-ab85-7b4b3347e16a
@bind column RangeSlider(1: size(my_array)[2], show_value=true)

# ╔═╡ dfef7ec8-383f-4872-9360-f65292c96412
row

# ╔═╡ 2ffe1d5e-04bf-4329-99e6-d5d59f78d501
column

# ╔═╡ 3dbfb290-d6b8-43c5-ad8d-9aa1a255a34a
my_array[row, column]

# ╔═╡ 0965852e-4a9b-4a69-af44-5482b9c0d2eb
my_array[[1:8], [1:4]]

# ╔═╡ Cell order:
# ╟─f8f382b0-96d9-11eb-051d-a7a73c6f14ae
# ╠═57382cd3-67e0-4680-ae4b-ca7733ad1fc3
# ╠═23d4273b-2641-4bc0-ab04-92a8d0a9a88e
# ╠═d958682d-5d67-4586-96a3-0502933e0860
# ╠═3ef156e9-95cf-4e26-8579-8616c4243ede
# ╠═13811c84-7941-485e-8a34-38852c794c61
# ╠═38554e79-11c9-45f7-b551-03d9c352b7b0
# ╠═26e17e09-60e0-4827-8750-74effa29883c
# ╠═8151c6bd-2f6d-4da5-b152-cc212010ede7
# ╠═cd4ff83c-cdac-44ea-9808-ffddc928f1f9
# ╠═c21bfc5a-f7eb-4fe1-b71a-b6fe09ad7af6
# ╠═f86d78d7-5ef7-4179-9dd5-667ab3f63721
# ╟─69551771-143e-4928-aa8c-47153a2f1f6c
# ╠═2695f753-53e8-4fd0-b0cb-3f343f718229
# ╠═2e8779a3-130b-492d-ae6d-63a0d5f5e1f1
# ╠═bd5e6cd3-7c8a-4367-b6f8-18e97d6091c1
# ╠═be564529-0fe7-475a-ad77-0b92eb7d16a8
# ╟─2dac8620-7a3a-4097-b4fc-452a7aefa15b
# ╟─9f981dd9-8ad3-4502-8696-f94ec2d49d5f
# ╟─9f854b75-9cc7-4d6b-b64b-d82306fa13fd
# ╟─a6ce5c01-eb44-4026-ab85-7b4b3347e16a
# ╠═dfef7ec8-383f-4872-9360-f65292c96412
# ╠═2ffe1d5e-04bf-4329-99e6-d5d59f78d501
# ╠═3dbfb290-d6b8-43c5-ad8d-9aa1a255a34a
# ╠═0965852e-4a9b-4a69-af44-5482b9c0d2eb
