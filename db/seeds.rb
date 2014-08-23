# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Fecha.create([
	{title: "DONAS GLASEADAS <br> KRISPY KREME", date: "23 DE JULIO EN ", price: "180.00", link: "http://bit.ly/mialacena-kk", city: "MERIDA, YUCATAN"},
	{title: "ROSCA BRIOCHE <br> TERE CAZOLA", date: "23 DE JULIO EN LA", price: "180.00", link: "http://bit.ly/mialacena-cazola", city: "DISTRITO FEDERAL"},
	{title: "DONAS SURTIDAS <br> KRISPY KREME", date: "23 DE JULIO EN", price: "230.00", link: "http://bit.ly/mialacena-kk-surtida", city: "MERIDA, YUCATAN"},
	{title: "HOJALDRAS <br> TERE CAZOLA", date: "23 DE JULIO EN LA", price: "180.00", link: "http://bit.ly/mialacena-hojaldra", city: "DISTRITO FEDERAL "},
	{title: "BOLITAS DE QUESO <br> TERE CAZOLA", date: "23 DE JULIO EN LA", price: "90.00", link: "http://bit.ly/mialacena-bolitas", city: "DISTRITO FEDERAL"},
	])


puts "==Tiendas=="

PaymentEstablishment.create(
	[
		{name: "Oxxo", key: "OXXO"},
		{name: "Seven Eleven", key: "SEVEN_ELEVEN"},
		{name: "Extra", key: "EXTRA"},
		{name: "Wallmart", key: "WALMART"},
		{name: "Soriana", key: "SORIANA"},
		{name: "Chedrahui", key: "CHEDRAUI"},
		{name: "Sams Club", key: "SAMS_CLUB"},
		{name: "Bodega Aurrera", key: "BODEGA_AURRERA"},
		{name: "Suprema", key: "SUPERAMA"},
		{name: "Elektra", key: "ELEKTRA"},
		{name: "Coppel", key: "COPPEL"},
		{name: "Vips", key: "VIPS"},
		{name: "El Porton", key: "EL_PORTON"},
		{name: "Farmacias Benavides", key: "FARMACIA_BENAVIDES"},
		{name: "Farmacias Guadalajara", key: "FARMACIA_GUADALAJARA"},
		{name: "Farmacias Esquivar", key: "FARMACIA_ESQUIVAR"},
	]
)
