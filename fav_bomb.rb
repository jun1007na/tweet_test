require 'twitter'
require 'yaml'

keys=YAML.load(File.open('./tweet_test_key.yml'))

client=Twitter::REST::Client.new do |config|
	config.consumer_key=keys["consumer_key"]
	config.consumer_secret=keys["consumer_secret"]
	config.access_token=keys["access_token"]
	config.access_token_secret=keys["access_token_secret"]
end

tweets=client.user_timeline(ARGV[0],:count=>1)
client.favorite(tweets)

client.update(ARGV[0]+"てｓｔ")