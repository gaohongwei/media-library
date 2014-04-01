$ ->
  $("input#profile_url").blur (event) ->
    url = event.currentTarget.value
    $.ajax
      url: "/media_library/uploads"
      type: "POST"
      data: {url: url},
      success: () -> console.log arguments
      error: () -> console.log arguments
