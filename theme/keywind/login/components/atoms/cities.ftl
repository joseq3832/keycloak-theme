<#macro kw>
  <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
    <div class="form-group">
      <div class="${properties.kcLabelWrapperClass!}">
        <label for="user.attributes.province" class="${properties.kcLabelClass!} mb-1 ml-2 text-sm text-gray-500">
          Provincia *</label>
      </div>

      <div class="${properties.kcInputWrapperClass!}">
        <select class="${properties.kcInputClass!} block border-secondary-200 mt-1 rounded-md w-full focus:border-primary-300 focus:ring focus:ring-primary-200 focus:ring-opacity-50 sm:text-sm"
          id="user.attributes.province" name="user.attributes.province" required>
          <option value="" disabled selected>Selecciona una provincia</option> <!-- Placeholder -->
        </select>
      </div>
    </div>

    <div class="form-group">
      <div class="${properties.kcLabelWrapperClass!}">
        <label for="user.attributes.city" class="${properties.kcLabelClass!} mb-1 ml-2 text-sm text-gray-500">
          Ciudad *
          </label>
      </div>

      <div class="${properties.kcInputWrapperClass!}">
        <select class="${properties.kcInputClass!} block border-secondary-200 mt-1 rounded-md w-full focus:border-primary-300 focus:ring focus:ring-primary-200 focus:ring-opacity-50 sm:text-sm"
          id="user.attributes.city" name="user.attributes.city" required>
          <option value="" disabled selected>Selecciona una ciudad</option> <!-- Placeholder -->
        </select>
      </div>
    </div>
  </div>

  <script>
    let provincesData = [];
    let citiesData = [];

    function fetchProvinces() {
      fetch('https://api.seminuevos.wtf/core/provinces?all')
        .then(response => response.json())
        .then(data => {
          console.log(data.data.set);
          provincesData = data.data.set;
          renderProvincesOptions();
        })
        .catch(error => console.error('Error:', error));
    }

    function fetchCities(provinceId) {
      fetch('https://api.seminuevos.wtf/core/cities?provinceId=' + provinceId + '&all')
        .then(response => response.json())
        .then(data => {
          console.log(data.data.set);
          citiesData = data.data.set;
          renderCitiesOptions();
        })
        .catch(error => console.error('Error:', error));
    }

    function renderProvincesOptions() {
      const selectInput = document.getElementById('user.attributes.province');
      selectInput.innerHTML = '';

      // Agregar el placeholder nuevamente
      const placeholderOption = document.createElement('option');
      placeholderOption.value = "";
      placeholderOption.disabled = true;
      placeholderOption.selected = true;
      placeholderOption.textContent = "Selecciona una provincia";
      selectInput.appendChild(placeholderOption);

      provincesData.forEach(province => {
        const option = document.createElement('option');
        option.value = province.id;
        option.text = province.name;
        selectInput.appendChild(option);
      });
    }

    function renderCitiesOptions() {
      const selectInput = document.getElementById('user.attributes.city');
      selectInput.innerHTML = '';

      // Agregar el placeholder nuevamente
      const placeholderOption = document.createElement('option');
      placeholderOption.value = "";
      placeholderOption.disabled = true;
      placeholderOption.selected = true;
      placeholderOption.textContent = "Selecciona una ciudad";
      selectInput.appendChild(placeholderOption);

      citiesData.forEach(city => {
        const option = document.createElement('option');
        option.value = city.id;
        option.text = city.name;
        selectInput.appendChild(option);
      });
    }

    document.addEventListener('DOMContentLoaded', function() {
      fetchProvinces();
      document.getElementById('user.attributes.province').addEventListener('change', function() {
        const selectedProvinceId = this.value;
        fetchCities(selectedProvinceId);
      });
    });
  </script>
</#macro>
