function initSelect2(fields) {
  var lastResultNames = [];
  $(fields).each(function() {
    $(this).select2({
      multiple: true,
      placeholder: "Tags",
      tokenSeparators: [","],
      ajax: {
        url: $(this).data("url"),
        dataType: "json",
        data: function (tag_includes) {
          console.log(tag_includes);
          var queryParameters = {
            query: { term: tag_includes }
          }
          return queryParameters;
        },
        results: function(data, page) {
          lastResultNames = $.map( data, function(tag, i) { return tag.name });
          return {
            results: $.map( data, function(tag, i) {
              return {
                id: tag.name, text: tag.name
              }
            })
          }
        }
        },
        createSearchChoice: function (input) {

          input = input.replace(/^\s+/, '').replace(/\s+$/, '')
          if (input !== '')
          {
            var new_item = lastResultNames.indexOf(input) < 0;
            if (new_item) {
              return { id: input, text: input + " (new)" }
            }
          }
        },
        minimumInputLength: 1
     });

    var tags = [$(this).data('value')];
    if (tags[0] != null) {
      var data = [];
      tags = tags.join().split(', ')
      $.each(tags, function( index, value ){
        data[index] = { id: value, text: value }
      });
      $(this).select2("data", data, true);
    }
  });
}
