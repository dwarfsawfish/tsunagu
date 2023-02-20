document.addEventListener('DOMContentLoaded', function(){

  const jobForm = document.getElementById('new_job');

  const jobPreviews = document.getElementById('job_previews');

  if (!jobForm) return null;


  const fileField = document.querySelector('input[type="file"][name="job[image]"]');

  fileField.addEventListener('change', function(e){

    const alreadyPreview = document.querySelector('.preview');
    if (alreadyPreview) {
      alreadyPreview.remove();
    };
    const file = e.target.files[0];
    const blob = window.URL.createObjectURL(file);

    const previewWrapper = document.createElement('div');
    previewWrapper.setAttribute('class', 'preview');
    // 表示する画像を生成
    const previewImage = document.createElement('img');
    previewImage.setAttribute('class', 'preview-image');
    previewImage.setAttribute('src', blob);


    previewWrapper.appendChild(previewImage);
    jobPreviews.appendChild(previewWrapper);
  });
});