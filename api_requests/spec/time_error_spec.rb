require 'time_error'

RSpec.describe TimeError do
  it "it returns difference for local and server time" do
  time_error_dbl = double :time_error_dbl
  allow(time_error_dbl).to receive(:get).with(URI("https://worldtimeapi.org/api/ip")).and_return('{
    "abbreviation": "GMT",
    "client_ip": "217.146.83.74",
    "datetime": "2022-03-15T13:48:36.883174+00:00",
    "day_of_week": 2,
    "day_of_year": 74,
    "dst": false,
    "dst_from": null,
    "dst_offset": 0,
    "dst_until": null,
    "raw_offset": 0,
    "timezone": "Europe/London",
    "unixtime": 1647352116,
    "utc_datetime": "2022-03-15T13:48:36.883174+00:00",
    "utc_offset": "+00:00",
    "week_number": 11
    }')
    time = Time.new(2022, 3, 15, 13, 48, 36)
    time_error = TimeError.new(time_error_dbl)
    result = time_error.error(time)
    expect(result).to eq 0.883174
  end
end