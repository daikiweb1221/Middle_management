namespace :reset_communications do
  desc 'コミュニケーション済の部下をリセットする'
	task reset_communications: :environment do
		Communication.destroy_all
	end
end
