(function($) {

  var root = this;

  return function() {

    var MediaLibrary = root.MediaLibrary = root.mediaLibrary || {};

    MediaLibrary.Uploader = {
      initUploader: function(options) {
        var uploader,
            settings,
            defaults = {
              runtimes : 'html5',
              browse_button : 'choose-files',
              container : 'file-uploader',
              max_file_size : '500mb'
            };

        settings = $.extend({}, defaults, typeof options === "object" && options);
        uploader = new plupload.Uploader(settings);

        return this.bindUploader(uploader);
      },

      bindUploader: function(uploader) {
        uploader.init();

        uploader.bind('FilesAdded', function(up, files) {
          $.each(files, function(i, file) {
            $('#filelist').append(
              '<div id="' + file.id + '">' +
              file.name + ' (' + plupload.formatSize(file.size) + ') <b></b>' +
              '</div>');
          });
          uploader.start();
        });

        uploader.bind('UploadProgress', function(up, file) {  
          $('body').trigger('uploadprogress',[file.percent]);
          //$('#' + file.id + " b").html(file.percent + "%");
        });

        uploader.bind('Error', function(up, err) {   
					$('body').trigger('UploadError',err);
          $('#filelist').append("<div>Error: " + err.code +
            ", Message: " + err.message +
            (err.file ? ", File: " + err.file.name : "") +
            "</div>"
          );
        });

        uploader.bind('FileUploaded', function(up, file, res) {
          var response = JSON.parse(res.response);
          if(response.error) {
            return $('body').trigger('UploadedError',[response]);
          }

          $('body').trigger('FileUploaded',[res]);
          $('#upload_id').val(response.item.item.id);
          $('#upload_type').val(response.item.profile.profileable_type);
          $("#upload_content_type").val(response.item.profile.content_type);
          $('#' + file.id + " b").html("100%");

          $('#image-thumbnail').append("<img src='" +
            response.item.item.file.medium.url + "' />");
        });
        uploader.splice();
        return uploader;
      }
    };
  };

}(jQuery)).call(this);
