namespace :csv do
  def clean_csv_data(csv_line)
    csv_line.map do |obj|
      if obj == "NULL"
        nil
      else
        obj
      end
    end
  end
  
  task :import => :environment do
    require 'csv'

    csv_file_names = %w[lines routes stations]
    csv_path = File.join(Rails.root, 'db', 'data')

    csv_file_names.each do |csv_name|
      klass = csv_name.classify.constantize
      parsed_csv = CSV.read(File.join(csv_path, "#{csv_name}.csv"))

      keys = []
      parsed_csv.each_with_index do |csv_line, index|
        if index == 0
          keys = csv_line
          next
        end

        csv_line = clean_csv_data(csv_line)

        transposed_array = [keys, csv_line].transpose
        obj = klass.new(Hash[transposed_array])
        Rails.logger.info(obj.inspect)
        obj.save!
      end
    end
  end
end
