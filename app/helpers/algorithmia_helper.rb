module AlgorithmiaHelper
  def altorithmia(algo, input)
    algorithmia_client.algo(algo).pipe(input).result
  end

  def algorithmia_client
    @algorithmia_client ||= Algorithmia.client(ENV['algorithmia_api_key'])
  end
end