bar1 = FactoryGirl.create(:bar, name: 'Charlie Pool Bar', wifi: true)
bar2 = FactoryGirl.create(:bar, name: 'Foo Bar', wifi: false)
bar3 = FactoryGirl.create(:bar, name: 'Bar Alfredo', wifi: true)
bar4 = FactoryGirl.create(:bar, name: 'Salvatore Bar', wifi: true)
bar5 = FactoryGirl.create(:bar, name: 'Space Monkey Bar', wifi: true)
bar6 = FactoryGirl.create(:bar, name: 'Raw', wifi: false)
bar7 = FactoryGirl.create(:bar, name: 'Antares', wifi: true)
bar8 = FactoryGirl.create(:bar, name: 'Sugar Bs As', wifi: true)

FactoryGirl.create(:location, lat: -34.5455969, lng: -58.4402055,
                              address: 'Intendente Güiraldes 22', bar: bar1)
FactoryGirl.create(:location, lat: -34.5461594, lng: -58.4407214,
                              address: 'Intendente Güiraldes 24', bar: bar2)
FactoryGirl.create(:location, lat: -34.5573429, lng: -58.4491869,
                              address: 'Juramento 1499', bar: bar3)
FactoryGirl.create(:location, lat: -34.5461594, lng: -58.4407214,
                              address: 'Intendente Güiraldes 20', bar: bar4)
FactoryGirl.create(:location, lat: -34.5815033, lng: -58.4259446,
                              address: 'Güemes 4600', bar: bar5)
FactoryGirl.create(:location, lat: -34.5805608, lng: -58.4275314,
                              address: 'Güemes 4800', bar: bar6)
FactoryGirl.create(:location, lat: -34.4909024, lng: -58.5143183,
                              address: 'Juramento 1599', bar: bar7)
FactoryGirl.create(:location, lat: -34.5452285, lng: -58.4410597,
                              address: 'Intendente Güiraldes 220', bar: bar8)
