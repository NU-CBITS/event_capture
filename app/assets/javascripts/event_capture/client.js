;(function() {
  'use strict';

  function EventCaptureClient(serverUrl) {
    this.serverUrl = serverUrl;
  }

  EventCaptureClient.prototype.log = function(options) {
    var data = {
      kind: options.kind,
      payload: options.payload,
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
