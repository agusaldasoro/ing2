require 'rails_helper'

describe BarsController do
  describe 'GET #index' do
    let!(:barWifi) do
      create(:bar, name: 'Foo Bar', wifi: true)
    end
    let!(:barNotWifi) do
      create(:bar, name: 'Foo Bar 2', wifi: false)
    end
    let!(:barAway) do
      create(:bar, name: 'Foo Bar 3', wifi: true)
    end
    let!(:barCloser) do
      create(:bar, name: 'Foo Bar 4', wifi: true)
    end
    let!(:address_IG22) do
      create(:location, lat: -34.5455969, lng: -58.4402055, address: 'Intendente Güiraldes 22', bar: barWifi)
    end
    let!(:address_IG24) do
      create(:location, lat: -34.5461594, lng: -58.4407214, address: 'Intendente Güiraldes 24', bar: barNotWifi)
    end
    let!(:lat_lng_J1499) do
      create(:location, lat: -34.5573429, lng: -58.4491869, address: 'Juramento 1499', bar: barAway)
    end
    let!(:lat_lng_IG20) do
      create(:location, lat: -34.5461594, lng: -58.4407214, address: 'Intendente Güiraldes 20', bar: barCloser)
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
          get :index, params: { wifi: 'true' }
        end

        it 'populates an array of bars' do
          expect(assigns(:bars)).to contain_exactly(barWifi, barAway, barCloser)
        end
      end

      context 'when false' do
        before :each do
          get :index, params: { wifi: 'false' }
        end

        it 'populates an array of bars' do
          expect(assigns(:bars)).to contain_exactly(barNotWifi)
        end
      end
    end

    context 'when distance params is given' do
      context 'when address is given' do
        it 'populates an array of bars' do
          get :index, params: { distance: '0.4',
                                address: 'Intendente Güiraldes 22' }
          expect(assigns(:bars)).to contain_exactly(barWifi, barNotWifi,
                                                    barCloser)
        end

        it 'populates an array of bars' do
          get :index, params: { distance: '0.4', address: 'Juramento 1499' }
          expect(assigns(:bars)).to contain_exactly(barAway)
        end
      end

      context 'when lat and lng are given' do
        it 'populates an array of bars' do
          get :index, params: { distance: '0.4', lat: -34.5452031,
                                lng: -58.4394956 }
          expect(assigns(:bars)).to contain_exactly(barWifi, barNotWifi,
                                                    barCloser)
        end

        it 'populates an array of bars' do
          get :index, params: { distance: '0.4', lat: -34.5573429,
                                lng: -58.4491869 }
          expect(assigns(:bars)).to contain_exactly(barAway)
        end
      end
    end

    context 'when wifi and distance params are given' do
      context 'when true and address is given' do
        it 'populates an array of bars' do
          get :index, params: { wifi: true, distance: '0.4',
                                address: 'Intendente Güiraldes 22' }
          expect(assigns(:bars)).to contain_exactly(barWifi, barCloser)
        end

        it 'populates an array of bars' do
          get :index, params: { wifi: true, distance: '0.4',
                                address: 'Juramento 1499' }
          expect(assigns(:bars)).to contain_exactly(barAway)
        end
      end

      context 'when false and address is given' do
        it 'populates an array of bars' do
          get :index, params: { wifi: false, distance: '0.4',
                                address: 'Intendente Güiraldes 22' }
          expect(assigns(:bars)).to contain_exactly(barNotWifi)
        end

        it 'populates an array of bars' do
          get :index, params: { wifi: false, distance: '0.4',
                                address: 'Juramento 1499' }
          expect(assigns(:bars)).to eq([])
        end
      end

      context 'when true lat and lng are given' do
        it 'populates an array of bars' do
          get :index, params: { wifi: true, distance: '0.4', lat: -34.5452031,
                                lng: -58.4394956 }
          expect(assigns(:bars)).to contain_exactly(barWifi, barCloser)
        end

        it 'populates an array of bars' do
          get :index, params: { wifi: true, distance: '0.4', lat: -34.5573429,
                                lng: -58.4491869 }
          expect(assigns(:bars)).to contain_exactly(barAway)
        end
      end

      context 'when false lat and lng are given' do
        it 'populates an array of bars' do
          get :index, params: { wifi: false, distance: '0.4', lat: -34.5452031,
                                lng: -58.4394956 }
          expect(assigns(:bars)).to contain_exactly(barNotWifi)
        end

        it 'populates an array of bars' do
          get :index, params: { wifi: false, distance: '0.4', lat: -34.5573429,
                                lng: -58.4491869 }
          expect(assigns(:bars)).to eq([])
        end
      end
    end
  end
end
