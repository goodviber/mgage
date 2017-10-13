desc "Import vote results from file"
task :import_votes => :environment do

  #Split the line as per requirements, on whitespace and colons
  def line_split(vote)
    hash = Hash.new
    hash[:vote], hash[:number], *rest = vote.split(/\s+/)
    rest.each_with_object(hash) do |part, hash|
      key, val = part.split(':')
      #ignore unrequired fields
      next if key =~ /^(CONN|MSISDN|GUID|Shortcode)$/
      hash[key.to_sym]=val
    end
  end

  #basic check for first 4 attributes, others ignored but can be included as required
  def vote_format(vote)
    /VOTE\s\d{10}\sCampaign:\w*\sValidity:\w*\sChoice:\w*/ =~ vote
  end

  File.open(Rails.root + "votes.txt", "r") do |file|
      file.each_line do |vote|
        begin
          #Check we have first 4 fields with regex
          if vote_format(vote) == 0
            result = line_split(vote)
            #Could puts result[:number] here for error log tracking

            #add data in correct order to models
            campaign = Campaign.find_or_create_by!(title: result[:Campaign])
            candidate = campaign.candidates.find_or_create_by!(name: result[:Choice])
            Vote.create!(number: result[:number], validity: result[:Validity], campaign_id: campaign.id, candidate_id: candidate.id)
          end
        rescue
          puts 'there is an error in the test file'
        end
      end
  end

end
