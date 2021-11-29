class Api::V1::RfcGeneratorController < ActionController::API

  def generate_rfc
    rfc_array     = RfcGenerated.generate_rfc api_params
    rfc           = rfc_array.join(',').gsub(',','').upcase
    rfc_existence = RfcGenerated.find_by(rfc: rfc)

    if rfc_existence.present?
      count = rfc_existence.counter + 1

      if rfc_existence.update(counter: count)
        render json: {status: 200, data: {rfc: rfc_existence.rfc, count: rfc_existence.counter}}
      end
    else
      rfc_generated = RfcGenerated.new(rfc: rfc, counter: 1)

      if rfc_generated.save
        render json: {status: 200, data: {rfc: rfc_generated.rfc, count: rfc_generated.counter}}
      else
        render json: {status: 400, data: {message: rfc_generated.errors}}
      end
    end
  end

  private
  def api_params
    params.require(:data).permit(:name, :last_name, :second_last_name, :birthdate)
  end
end