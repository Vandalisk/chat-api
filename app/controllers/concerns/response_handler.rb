module ResponseHandler
  def halt(status, message = nil)
    status = Rack::Utils.status_code(status) if status.is_a?(Symbol)
    message = Rack::Utils::HTTP_STATUS_CODES[status] if message.nil?
    data = { message: message }

    yield data if block_given?

    render json: data, status: status
  end
end
