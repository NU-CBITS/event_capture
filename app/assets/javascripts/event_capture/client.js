;(function() {
  function EventCaptureClient(serverUrl) {
    this.serverUrl = serverUrl;
  }

  EventCaptureClient.prototype.log = function(attributes) {
    var data = {
      payload: attributes.payload,
      emittedAt: (new Date()).toISOString()
    };

    return $.ajax({
      type: 'POST',
      url: this.serverUrl,
      data: data
    });
  };

  window.EventCaptureClient = EventCaptureClient;
})();
