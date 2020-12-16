var imagesPreview = function(input, placeToInsertImagePreview) {

  if (input.files) {

    for (var i in input.files) {
      var reader = new FileReader();

      reader.onload = function(event) {
          $($.parseHTML('<img>')).attr('src', event.target.result).appendTo(placeToInsertImagePreview);
      }
      if (Number.isInteger(input.files[i]) || (typeof input.files[i] == "function")) {
        continue;
      }
      reader.readAsDataURL(input.files[i]);
    }
  }

};

const previewImageOnFileSelect = () => {
    // Multiple images preview in browser


    $('#photo-input').on('change', function() {
        imagesPreview(this, 'div.gallery');
    });
};

export {previewImageOnFileSelect};
