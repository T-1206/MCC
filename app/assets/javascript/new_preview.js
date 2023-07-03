document.addEventListener('DOMContentLoaded', function() {
    const imageInput = document.getElementById('imageInput');
    const imagePreview = document.getElementById('imagePreview').querySelector('img');
    imageInput.addEventListener('change', function(event) {
        const file = event.target.files[0];

        if (file) {
            const reader = new FileReader();

            reader.addEventListener('load', function() {
                imagePreview.src = reader.result;
            });

            reader.readAsDataURL(file);
        } else {
            imagePreview.src = '';
        }
    });
});
