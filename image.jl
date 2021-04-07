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

# ╔═╡ 90f0f350-95a3-11eb-2914-efa4ba87186d
begin
	import Pkg
	Pkg.activate(mktempdir())
	Pkg.add([
		Pkg.PackageSpec(name="ImageIO", version="0.5"),
		Pkg.PackageSpec(name="ImageShow", version="0.2"),
		Pkg.PackageSpec(name="FileIO", version="1.6"),
		Pkg.PackageSpec(name="PNGFiles", version="0.3.6"),
		Pkg.PackageSpec(name="Colors", version="0.12"),
		Pkg.PackageSpec(name="ColorVectorSpace", version="0.8"),
		Pkg.PackageSpec(name="PlutoUI", version="0.7"), 
		Pkg.PackageSpec(name="HypertextLiteral", version="0.5")
	])

	using Colors, ColorVectorSpace, ImageShow, FileIO
	using PlutoUI
	using HypertextLiteral
end

# ╔═╡ 93342f11-368a-4761-a6d3-d9dc44998276
url = "https://user-images.githubusercontent.com/6933510/107239146-dcc3fd00-6a28-11eb-8c7b-41aaf6618935.png" 

# ╔═╡ ca8cc017-2779-4765-869b-99b5c563a33c
philip_filename = download(url)

# ╔═╡ b310d050-f3c9-47e4-89f0-97ff93512549
philip = load(philip_filename)

# ╔═╡ f44d2dde-df6e-42f1-9176-5ae0e6f76e2f
x = philip

# ╔═╡ abcbf095-2642-438b-86fa-62a548705bb6
begin
	philip_size = size(philip)
	heigth = size(philip)[1]
	width = size(philip)[2]
end

# ╔═╡ 525d8c4f-9345-4d7a-9188-46f86d68c19c
a_pixel = philip[1,1]

# ╔═╡ 0293b875-9fb9-4ad4-965d-99c13e6b1d99
@bind row_i Slider(1:heigth, show_value=true)

# ╔═╡ d0e7d30c-ed75-40ba-a4f9-606fd2aa38eb
@bind col_i Slider(1:width, show_value=true)

# ╔═╡ 2f376b5d-27ae-4196-bf00-acedcca57495
philip[row_i, col_i]

# ╔═╡ 79f8da99-8856-4b55-bc0b-c98558764160
row_i, col_i

# ╔═╡ 98cf45e5-861b-49d1-b318-a19d71f4a2ef
begin
	half_heigth = Int(heigth / 2)
	half_width = Int(width / 2)
	half_width, half_heigth
end

# ╔═╡ 03e2e59f-32cd-47ce-b231-4e66a3c31514
square2 = philip[1:half_heigth, half_width:width]

# ╔═╡ 590f724f-cc63-4aa6-b16b-66fd97cf7f16
square4 = philip[half_heigth:heigth, half_width:width]

# ╔═╡ f84ff569-47e0-4f49-ba9a-537a39e83160
square1 = philip[1:half_heigth, 1:half_width]

# ╔═╡ dc0217ba-00df-4447-9234-ae323ea7e7db
square3 = philip[half_heigth : heigth, 1:half_width]

# ╔═╡ 374195aa-4d1c-43ef-a93d-2a91130975ed
[square3                   reverse(square3, dims=2)
 reverse(square3, dims=1)  rot180(square3)]

# ╔═╡ 98a672e5-5798-4bcd-8da8-f2a4aed6df53
@bind range_rows RangeSlider(1: heigth)

# ╔═╡ bc8eddfd-a504-4d21-bce1-070e3c9ef106
range_rows

# ╔═╡ 1a90be02-1b72-4614-bc30-159f2494d03a
@bind range_columns RangeSlider(1: width)

# ╔═╡ cb44712e-c011-41bc-9df7-e431db43e2f8
range_columns

# ╔═╡ a184c0d9-0dcb-45eb-b6bb-cb509ce98963
recur_image = philip[range_rows, range_columns]

# ╔═╡ 17d63155-48d0-4dba-89e6-ff785d2d7702
[recur_image reverse(recur_image, dims=2)
reverse(recur_image, dims=1) rot180(recur_image)]

# ╔═╡ Cell order:
# ╠═90f0f350-95a3-11eb-2914-efa4ba87186d
# ╠═93342f11-368a-4761-a6d3-d9dc44998276
# ╠═ca8cc017-2779-4765-869b-99b5c563a33c
# ╠═b310d050-f3c9-47e4-89f0-97ff93512549
# ╠═f44d2dde-df6e-42f1-9176-5ae0e6f76e2f
# ╠═abcbf095-2642-438b-86fa-62a548705bb6
# ╠═525d8c4f-9345-4d7a-9188-46f86d68c19c
# ╠═2f376b5d-27ae-4196-bf00-acedcca57495
# ╠═0293b875-9fb9-4ad4-965d-99c13e6b1d99
# ╠═d0e7d30c-ed75-40ba-a4f9-606fd2aa38eb
# ╠═79f8da99-8856-4b55-bc0b-c98558764160
# ╠═98cf45e5-861b-49d1-b318-a19d71f4a2ef
# ╠═03e2e59f-32cd-47ce-b231-4e66a3c31514
# ╠═590f724f-cc63-4aa6-b16b-66fd97cf7f16
# ╠═f84ff569-47e0-4f49-ba9a-537a39e83160
# ╠═dc0217ba-00df-4447-9234-ae323ea7e7db
# ╠═374195aa-4d1c-43ef-a93d-2a91130975ed
# ╠═bc8eddfd-a504-4d21-bce1-070e3c9ef106
# ╠═cb44712e-c011-41bc-9df7-e431db43e2f8
# ╠═a184c0d9-0dcb-45eb-b6bb-cb509ce98963
# ╠═98a672e5-5798-4bcd-8da8-f2a4aed6df53
# ╠═1a90be02-1b72-4614-bc30-159f2494d03a
# ╠═17d63155-48d0-4dba-89e6-ff785d2d7702
