class RfcGenerated < ActiveRecord::Base
  def self.generate_rfc rfc_data
    name        = rfc_data[:name].parameterize
    last_name   = rfc_data[:last_name].parameterize
    s_last_name = rfc_data[:second_last_name].parameterize
    birthdate   = rfc_data[:birthdate].to_datetime
    rfc_array   = Array.new

    #===========LAST_NAME===========#
    rfc_array[0]  = "#{last_name[0]}"
    vowel_index   = last_name.index(/[aeiou]/i)

    if vowel_index.present?
      rfc_array[0] << "#{last_name[vowel_index]}"
    else
      rfc_array[0] << "#{last_name[1]}"
    end

    #=======SECOND_LAST_NAME========#
    if s_last_name.present?
      rfc_array[1]  = "#{s_last_name[0]}"
    else
      rfc_array[1]  = 'X'
    end

    #=============NAME==============#
    rfc_array[2]  = "#{name[0]}"

    #============YEAR===============#
    rfc_array[3]  = birthdate.strftime('%y')

    #===========MONTH===============#
    rfc_array[4]  = birthdate.strftime('%m')

    #=============DAY===============#
    rfc_array[5]  = birthdate.strftime('%d')

    return rfc_array
  end

  def self.validate_blank_params api_params
    api_params[:name].blank? || api_params[:last_name].blank? || api_params[:birthdate].blank? ?  true : false
  end
end