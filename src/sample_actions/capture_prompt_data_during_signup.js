exports.onExecutePreUserRegistration = async (event, api) => {
    const tos = event.request.body['terms-of-service'];
    if(!tos) {
      api.validation.error("invalid_payload", "Missing Name");
      return;
    }

    todayDate = new Date.now();
  
    api.user.setUserMetadata("approvedTos", {value: tos, dateApproved: todayDate.toUTCString()});
  };