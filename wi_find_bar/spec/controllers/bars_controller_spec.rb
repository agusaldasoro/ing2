require 'rails_helper'

describe BarsController do
  describe 'GET #index' do
    let!(:barWifi) { create(:bar, name: 'Foo Bar') }
    let!(:barNotWifi) { create(:bar, name: 'Foo Bar 2') }
    let!(:barAway) { create(:bar, name: 'Foo Bar 3') }
    let!(:barCloser) { create(:bar, name: 'Foo Bar 4') }

    let!(:wifi_1) { create(:has_wifi, value: 'true', bar: barWifi) }
    let!(:wifi_2) { create(:has_wifi, value: 'false', bar: barNotWifi) }
    let!(:wifi_3) { create(:has_wifi, value: 'true', bar: barAway) }
    let!(:wifi_4) { create(:has_wifi, value: 'true', bar: barCloser) }

    let!(:address_IG22) do
      create(:address, lat: -34.5455969, lng: -58.4402055,
                       value: 'Intendente Güiraldes 22', bar: barWifi)
    end
    let!(:address_IG24) do
      create(:address, lat: -34.5461594, lng: -58.4407214,
                       value: 'Intendente Güiraldes 24', bar: barNotWifi)
    end
    let!(:lat_lng_J1499) do
      create(:address, lat: -34.5573429, lng: -58.4491869,
                       value: 'Juramento 1499', bar: barAway)
    end
    let!(:lat_lng_IG20) do
      create(:address, lat: -34.5461594, lng: -58.4407214,
                       value: 'Intendente Güiraldes 20', bar: barCloser)
    end

    context 'when none params are given' do
      before :each do
        get :index
      end

      it 'populates an array of bars' do
        expect(assigns(:bars)).to contain_exactly(barWifi, barNotWifi, barAway,
                                                  barCloser)
      end

      it 'renders the :index view' do
        expect(response).to render_template :index
      end
    end

    context 'when weird params are given' do
      before :each do
        get :index, params: { weird_param: 'asdada' }
      end

      it 'populates an array of bars' do
        expect(assigns(:bars)).to contain_exactly(barWifi, barNotWifi, barAway,
                                                  barCloser)
      end
    end

    context 'when wifi params is given' do
      context 'when true' do
        before :each do
          get :index, params: { filter_has: { has_wifi: 'true' } }
        end

        it 'populates an array of bars' do
          expect(assigns(:bars)).to contain_exactly(barWifi, barAway, barCloser)
        end
      end

      context 'when false' do
        before :each do
          get :index, params: { filter_has: { has_wifi: 'false' } }
        end

        it 'populates an array of bars' do
          expect(assigns(:bars)).to contain_exactly(barNotWifi)
        end
      end
    end

    context 'when distance and address params are given' do
      it 'populates an array of bars' do
        get :index, params: { filter_distance: { distance: '0.4',
                                                 address: 'Intendente Güiraldes 22' } }
        expect(assigns(:bars)).to contain_exactly(barWifi, barNotWifi,
                                                  barCloser)
      end

      it 'populates an array of bars' do
        get :index, params: { filter_distance: { distance: '0.4', address: 'Juramento 1499' } }
        expect(assigns(:bars)).to contain_exactly(barAway)
      end
    end

    context 'when only distance params are given' do
      it 'populates an array of bars' do
        get :index, params: { filter_distance: { distance: '0.4' } }
        expect(assigns(:bars)).to contain_exactly(barWifi, barNotWifi, barAway,
                                                  barCloser)
      end
    end

    context 'when only address params are given' do
      it 'populates an array of bars' do
        get :index, params: { filter_distance: { address: 'Intendente Güiraldes 22' } }
        expect(assigns(:bars)).to contain_exactly(barWifi, barNotWifi, barAway,
                                                  barCloser)
      end
    end

    context 'when wifi and distance params are given' do
      context 'and wifi:true, address & distance correct' do
        it 'populates an array of bars' do
          get :index, params: { filter_has: { has_wifi: true },
                                filter_distance: { distance: '0.4',
                                                   address: 'Intendente Güiraldes 22' } }
          expect(assigns(:bars)).to contain_exactly(barWifi, barCloser)
        end

        it 'populates an array of bars' do
          get :index, params: { filter_has: { has_wifi: true },
                                filter_distance: { distance: '0.4',
                                                   address: 'Juramento 1499' } }
          expect(assigns(:bars)).to contain_exactly(barAway)
        end
      end

      context 'and wifi:true, address is missing' do
        before :each do
          get :index, params: { filter_has: { has_wifi: 'true' },
                                filter_distance: { distance: '0.4' } }
        end

        it 'populates an array of bars' do
          expect(assigns(:bars)).to contain_exactly(barWifi, barAway, barCloser)
        end
      end

      context 'and wifi:true, distance is missing' do
        before :each do
          get :index, params: { filter_has: { has_wifi: 'true' },
                                filter_distance: { address: 'Intendente Güiraldes 22' } }
        end

        it 'populates an array of bars' do
          expect(assigns(:bars)).to contain_exactly(barWifi, barAway, barCloser)
        end
      end

      context 'and wifi:false, address & distance correct' do
        it 'populates an array of bars' do
          get :index, params: { filter_has: { has_wifi: false },
                                filter_distance: { distance: '0.4',
                                                   address: 'Intendente Güiraldes 22' } }
          expect(assigns(:bars)).to contain_exactly(barNotWifi)
        end

        it 'populates an array of bars' do
          get :index, params: { filter_has: { has_wifi: false },
                                filter_distance: { distance: '0.4',
                                                   address: 'Juramento 1499' } }
          expect(assigns(:bars)).to eq([])
        end
      end

      context 'and wifi:false, address is missing' do
        before :each do
          get :index, params: { filter_has: { has_wifi: 'false' },
                                filter_distance: { distance: '0.4' } }
        end

        it 'populates an array of bars' do
          expect(assigns(:bars)).to contain_exactly(barNotWifi)
        end
      end

      context 'and wifi:false, address is missing' do
        before :each do
          get :index, params: { filter_has: { has_wifi: 'false' },
                                filter_distance: { address: 'Intendente Güiraldes 22' } }
        end

        it 'populates an array of bars' do
          expect(assigns(:bars)).to contain_exactly(barNotWifi)
        end
      end
    end
  end
end
