document.addEventListener('turbolinks:load', function() {
  let btnImportSpreadsheet = document.getElementById('btn_import_spreadsheet');
  let spreadsheetField = document.getElementById('spreadsheet_upload');

  btnImportSpreadsheet.addEventListener('click', function(e) {
    e.preventDefault();
    spreadsheetField.click();
  });

   spreadsheetField.addEventListener('change', function() {
    spreadsheetField.parentNode.submit();
  });
});
