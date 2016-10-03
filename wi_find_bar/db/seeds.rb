bar1 = FactoryGirl.create(:bar, name: 'Charlie Pool Bar')
bar2 = FactoryGirl.create(:bar, name: 'Foo Bar')
bar3 = FactoryGirl.create(:bar, name: 'Bar Alfredo')
bar4 = FactoryGirl.create(:bar, name: 'Salvatore Bar')
bar5 = FactoryGirl.create(:bar, name: 'Space Monkey Bar')
bar6 = FactoryGirl.create(:bar, name: 'Raw')
bar7 = FactoryGirl.create(:bar, name: 'Antares')
bar8 = FactoryGirl.create(:bar, name: 'Sugar Bs As')

FactoryGirl.create(:has_wifi, value: 'true', bar: bar1)
FactoryGirl.create(:has_wifi, value: 'false', bar: bar2)
FactoryGirl.create(:has_wifi, value: 'true', bar: bar3)
FactoryGirl.create(:has_wifi, value: 'true', bar: bar4)
FactoryGirl.create(:has_wifi, value: 'true', bar: bar5)
FactoryGirl.create(:has_wifi, value: 'false', bar: bar6)
FactoryGirl.create(:has_wifi, value: 'false', bar: bar7)
FactoryGirl.create(:has_wifi, value: 'true', bar: bar8)

FactoryGirl.create(:address, lat: -34.5455925, lng: -58.4402055,
                             value: 'Intendente Güiraldes 22', bar: bar1)
FactoryGirl.create(:address, lat: -34.546155, lng: -58.4407214,
                             value: 'Intendente Güiraldes 24', bar: bar2)
FactoryGirl.create(:address, lat: -34.556668, lng: -58.4498764,
                             value: 'Juramento 1499', bar: bar3)
FactoryGirl.create(:address, lat: -34.5452241, lng: -58.4410597,
                             value: 'Intendente Güiraldes 200', bar: bar4)
FactoryGirl.create(:address, lat: -34.5814989, lng: -58.4259446,
                             value: 'Güemes 4600', bar: bar5)
FactoryGirl.create(:address, lat: -34.5805564, lng: -58.4275314,
                             value: 'Güemes 4800', bar: bar6)
FactoryGirl.create(:address, lat: -34.5574032, lng: -58.451084,
                             value: 'Juramento 1599', bar: bar7)
FactoryGirl.create(:address, lat: -34.5452285, lng: -58.4410597,
                             value: 'Intendente Güiraldes 220', bar: bar8)
