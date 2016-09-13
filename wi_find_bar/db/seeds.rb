bar1 = FactoryGirl.create(:bar, name: 'Foo Bar 1', wifi: true)
bar2 = FactoryGirl.create(:bar, name: 'Foo Bar 2', wifi: false)
bar3 = FactoryGirl.create(:bar, name: 'Foo Bar 3', wifi: true)
bar4 = FactoryGirl.create(:bar, name: 'Foo Bar 4', wifi: true)
bar5 = FactoryGirl.create(:bar, name: 'Foo Bar 5', wifi: true)
bar6 = FactoryGirl.create(:bar, name: 'Foo Bar 6', wifi: false)
bar7 = FactoryGirl.create(:bar, name: 'Foo Bar 7', wifi: true)
bar8 = FactoryGirl.create(:bar, name: 'Foo Bar 8', wifi: true)

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
