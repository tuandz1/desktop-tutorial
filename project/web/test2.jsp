<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Upload Images</title>
</head>
<body>

<form id="uploadForm">
    <input type="file" name="imgs" id="fileInput" multiple accept="image/*" class="form-control">
    <div id="errorMessages" style="color: red;"></div>
    <button type="submit">Upload</button>
</form>

<script>
document.getElementById('fileInput').addEventListener('change', function(event) {
    const files = event.target.files;
    const errorMessages = document.getElementById('errorMessages');
    errorMessages.innerHTML = '';

    let allValid = true;
    let imagesLoaded = 0;
    const totalImages = files.length;

    for (let i = 0; i < totalImages; i++) {
        const file = files[i];
        const img = new Image();

        img.onload = function() {
            if (img.width !== img.height) {
                allValid = false;
                const message = `The image ${file.name} does not have a 1:1 aspect ratio.<br>`;
                errorMessages.innerHTML += message;
            }
            imagesLoaded++;
            checkAllImagesLoaded();
        }

        img.src = URL.createObjectURL(file);
    }

    function checkAllImagesLoaded() {
        if (imagesLoaded === totalImages) {
            document.getElementById('uploadForm').addEventListener('submit', function(event) {
                if (!allValid) {
                    event.preventDefault();
                    alert('Please ensure all images have a 1:1 aspect ratio before uploading.');
                }
            });
        }
    }
});
</script>

</body>
</html>


