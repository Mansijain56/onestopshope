User.first.products.create([
	{
		brand: "Oneplus",
		model: "T.V",
		category: "Home",
		price: 30000
	},
		{
		brand: "Apple",
		model: "Adapter",
		category: "Mobile",
		price: 2300
	},
	{
		brand: "Piegon",
		model: "Coffe Maker",
		category: "Kitchen",
		price: 11000
	}

])

Product.first.images.attach(io: File.open("/home/lp14/Downloads/oneplus_tv.webp"), filename: "first_image")
Product.second.images.attach(io: File.open("/home/lp14/Downloads/apple_charger.jpeg"), filename: "first_image")
Product.third.images.attach(io: File.open("/home/lp14/Downloads/Piegon_brewster.jpg"), filename: "first_image")