(() => {
  "use strict";

  /*
   * ============================================================
   * SMARTHIRE - SMART SEARCH
   * ============================================================
   *
   * FEATURES
   * 1. Job role autocomplete
   * 2. Custom company dropdown
   * 3. Dynamic company API search
   * 4. Custom location dropdown
   * 5. Country-wise city browsing
   * 6. Dynamic city search
   * 7. Remote location
   * 8. Custom Experience dropdown
   * 9. Custom Date Posted dropdown
   * 10. Keyboard support
   * 11. Outside click support
   * 12. API fallback
   *
   * ============================================================
   */

  /* ============================================================
       CONFIGURATION
       ============================================================ */

  const CONFIG = {
    countriesApi: "https://countries.dev",
    companiesApi: "https://freehire.me/api/v1/companies",

    citiesLimit: 40,
    companiesLimit: 100,
    suggestionLimit: 8,

    searchDebounce: 350,
  };

  /* ============================================================
       CUSTOM OPTIONS
       
       YAHAN SE TUM APNE OPTIONS ADD / REMOVE KAR SAKTE HO
       ============================================================ */

  const CUSTOM_OPTIONS = {
    /* ---------------- COMPANY OPTIONS ---------------- */

    companies: [
      "TCS",
      "Infosys",
      "Wipro",
      "Accenture",
      "Cognizant",
      "Capgemini",
      "HCL",
      "Tech Mahindra",
      "Deloitte",
      "Microsoft",
      "Amazon",
      "Google",
      "IBM",
      "Oracle",
      "Adobe",
      "Cisco",
      "SAP",
      "Salesforce",
      "Zoho",
      "Razorpay",
      "Flipkart",
      "Walmart",
      "Paytm",
      "Myntra",
      "Swiggy",
      "Zomato",
      "Freshworks",
      "PhonePe",
      "Jio",
      "Accenture Technology",
    ],

    /* ---------------- LOCATION OPTIONS ---------------- */

    locations: [
      "Pune",
      "Mumbai",
      "Bengaluru",
      "Hyderabad",
      "Chennai",
      "Delhi NCR",
      "Noida",
      "Gurugram",
      "Kolkata",
      "Ahmedabad",
      "Jaipur",
      "Indore",
      "Ujjain",
      "Nagpur",
      "Nashik",
      "Surat",
      "Vadodara",
      "Bhopal",
      "Chandigarh",
      "Coimbatore",
      "Kochi",
      "Mysuru",
      "Remote",
    ],

    /* ---------------- EXPERIENCE OPTIONS ---------------- */

    experience: [
      {
        value: "",
        label: "All Experiences",
      },
      {
        value: "Fresher",
        label: "Fresher",
      },
      {
        value: "1-3 years",
        label: "1-3 years",
      },
      {
        value: "3-5 years",
        label: "3-5 years",
      },
      {
        value: "5+ years",
        label: "5+ years",
      },
    ],

    /* ---------------- DATE POSTED OPTIONS ---------------- */

    posted: [
      {
        value: "",
        label: "Date Posted (Newest)",
      },
      {
        value: "today",
        label: "Today",
      },
      {
        value: "3",
        label: "Last 3 days",
      },
      {
        value: "7",
        label: "Last 7 days",
      },
      {
        value: "30",
        label: "Last 30 days",
      },
    ],
  };

  /* ============================================================
       JOB ROLE SUGGESTIONS
       ============================================================ */

  const roleSuggestions = [
    {
      value: "Java Developer",
      type: "role",
      icon: "fa-brands fa-java",
      meta: "Job Role",
    },

    {
      value: "Spring Boot Developer",
      type: "role",
      icon: "fa-solid fa-leaf",
      meta: "Job Role",
    },

    {
      value: "MERN Stack Developer",
      type: "role",
      icon: "fa-brands fa-node-js",
      meta: "Job Role",
    },

    {
      value: "Frontend Developer",
      type: "role",
      icon: "fa-solid fa-code",
      meta: "Job Role",
    },

    {
      value: "Full Stack Developer",
      type: "role",
      icon: "fa-solid fa-layer-group",
      meta: "Job Role",
    },

    {
      value: "Full Stack Engineer",
      type: "role",
      icon: "fa-solid fa-layer-group",
      meta: "Job Role",
    },

    {
      value: "Backend Developer",
      type: "role",
      icon: "fa-solid fa-server",
      meta: "Job Role",
    },

    {
      value: "Software Engineer",
      type: "role",
      icon: "fa-solid fa-laptop-code",
      meta: "Job Role",
    },

    {
      value: "Data Analyst",
      type: "role",
      icon: "fa-solid fa-chart-line",
      meta: "Job Role",
    },

    {
      value: "Product Designer",
      type: "role",
      icon: "fa-solid fa-pen-ruler",
      meta: "Job Role",
    },

    {
      value: "DevOps Engineer",
      type: "role",
      icon: "fa-solid fa-server",
      meta: "Job Role",
    },

    {
      value: "QA Automation Engineer",
      type: "role",
      icon: "fa-solid fa-vial",
      meta: "Job Role",
    },

    {
      value: "Machine Learning Engineer",
      type: "role",
      icon: "fa-solid fa-brain",
      meta: "Job Role",
    },

    {
      value: "Python Developer",
      type: "role",
      icon: "fa-brands fa-python",
      meta: "Job Role",
    },

    {
      value: "Node.js Developer",
      type: "role",
      icon: "fa-brands fa-node-js",
      meta: "Job Role",
    },

    {
      value: "React Developer",
      type: "role",
      icon: "fa-brands fa-react",
      meta: "Job Role",
    },

    {
      value: "Angular Developer",
      type: "role",
      icon: "fa-brands fa-angular",
      meta: "Job Role",
    },
  ];

  /* ============================================================
       APPLICATION STATE
       ============================================================ */

  const state = {
    countries: [],
    countriesLoaded: false,
    countriesLoading: false,

    citiesCache: new Map(),

    companies: [],
    companiesLoaded: false,
    companiesLoading: false,
  };

  /* ============================================================
       COMMON HELPERS
       ============================================================ */

  function escapeHtml(value) {
    return String(value ?? "")
      .replace(/&/g, "&amp;")
      .replace(/</g, "&lt;")
      .replace(/>/g, "&gt;")
      .replace(/"/g, "&quot;")
      .replace(/'/g, "&#039;");
  }

  function debounce(callback, delay) {
    let timer = null;

    return (...args) => {
      clearTimeout(timer);

      timer = setTimeout(() => {
        callback(...args);
      }, delay);
    };
  }

  function closeAll(except = null) {
    document
      .querySelectorAll(".smart-search.is-open, .search-select.is-open")
      .forEach((element) => {
        if (element !== except) {
          element.classList.remove("is-open");
        }
      });
  }

  function dispatchChange(select) {
    select.dispatchEvent(
      new Event("change", {
        bubbles: true,
      }),
    );
  }

  function uniqueArray(array) {
    return [
      ...new Set(
        array
          .filter((item) => item)
          .map((item) => String(item).trim())
          .filter((item) => item.length > 0),
      ),
    ];
  }

  /* ============================================================
       JOB ROLE SMART SEARCH
       ============================================================ */

  function createSuggestion(input, suggestion) {
    const button = document.createElement("button");

    button.type = "button";
    button.className = "smart-suggestion";

    button.innerHTML = `
            <span class="smart-suggestion-icon">
                <i class="${escapeHtml(suggestion.icon)}"></i>
            </span>

            <span class="smart-suggestion-content">
                <strong>
                    ${escapeHtml(suggestion.value)}
                </strong>

                <small>
                    ${escapeHtml(suggestion.meta)}
                </small>
            </span>

            <i class="fa-solid fa-arrow-up-right-from-square smart-suggestion-arrow"></i>
        `;

    button.addEventListener("click", () => {
      input.value = suggestion.value;

      dispatchChange(input);

      const box = input.closest(".smart-search");

      if (box) {
        box.classList.remove("is-open");
      }
    });

    return button;
  }

  function setupSmartSearch(input) {
    if (!input) {
      return;
    }

    if (input.dataset.smartSearchReady === "true") {
      return;
    }

    input.dataset.smartSearchReady = "true";

    const wrapper = document.createElement("div");

    wrapper.className = "smart-search";

    input.parentNode.insertBefore(wrapper, input);

    wrapper.appendChild(input);

    const suggestionBox = document.createElement("div");

    suggestionBox.className = "smart-suggestions";

    wrapper.appendChild(suggestionBox);

    function renderSuggestions() {
      const query = input.value.trim().toLowerCase();

      suggestionBox.innerHTML = "";

      const filtered = roleSuggestions
        .filter((item) => {
          if (!query) {
            return true;
          }

          return item.value.toLowerCase().includes(query);
        })
        .slice(0, CONFIG.suggestionLimit);

      if (!filtered.length) {
        suggestionBox.innerHTML = `
                    <div class="smart-no-results">

                        <i class="fa-solid fa-magnifying-glass"></i>

                        <span>
                            No matching job roles
                        </span>

                    </div>
                `;
      } else {
        filtered.forEach((suggestion) => {
          suggestionBox.appendChild(createSuggestion(input, suggestion));
        });
      }

      wrapper.classList.add("is-open");
    }

    input.addEventListener("focus", () => {
      closeAll(wrapper);

      renderSuggestions();
    });

    input.addEventListener("input", () => {
      closeAll(wrapper);

      renderSuggestions();
    });

    input.addEventListener("keydown", (event) => {
      if (event.key === "Escape") {
        wrapper.classList.remove("is-open");
      }
    });
  }

  /* ============================================================
       COUNTRY API
       ============================================================ */

  async function loadCountries() {
    if (state.countriesLoaded) {
      return state.countries;
    }

    if (state.countriesLoading) {
      return new Promise((resolve) => {
        const timer = setInterval(() => {
          if (state.countriesLoaded || !state.countriesLoading) {
            clearInterval(timer);

            resolve(state.countries);
          }
        }, 100);
      });
    }

    state.countriesLoading = true;

    try {
      const url =
        `${CONFIG.countriesApi}/countries` +
        `?fields=name,alpha2Code,flag,region,subregion` +
        `&sort=name&order=asc`;

      const response = await fetch(url);

      if (!response.ok) {
        throw new Error(`Countries API failed: ${response.status}`);
      }

      const data = await response.json();

      state.countries = Array.isArray(data) ? data : [];

      state.countriesLoaded = true;
    } catch (error) {
      console.error("SMARTHIRE: Unable to load countries.", error);

      state.countries = [];
    } finally {
      state.countriesLoading = false;
    }

    return state.countries;
  }

  /* ============================================================
       CITY API
       ============================================================ */

  async function loadCities(countryCode) {
    if (!countryCode) {
      return [];
    }

    if (state.citiesCache.has(countryCode)) {
      return state.citiesCache.get(countryCode);
    }

    try {
      const url =
        `${CONFIG.countriesApi}/cities` +
        `?country=${encodeURIComponent(countryCode)}` +
        `&limit=${CONFIG.citiesLimit}`;

      const response = await fetch(url);

      if (!response.ok) {
        throw new Error(`Cities API failed: ${response.status}`);
      }

      const data = await response.json();

      const cities = Array.isArray(data) ? data : [];

      state.citiesCache.set(countryCode, cities);

      return cities;
    } catch (error) {
      console.error("SMARTHIRE: Unable to load cities.", error);

      state.citiesCache.set(countryCode, []);

      return [];
    }
  }

  async function searchCities(query) {
    if (!query) {
      return [];
    }

    try {
      const url =
        `${CONFIG.countriesApi}/cities` +
        `?q=${encodeURIComponent(query)}` +
        `&limit=30`;

      const response = await fetch(url);

      if (!response.ok) {
        throw new Error(`City search failed: ${response.status}`);
      }

      const data = await response.json();

      return Array.isArray(data) ? data : [];
    } catch (error) {
      console.error("SMARTHIRE: City search failed.", error);

      return [];
    }
  }

  /* ============================================================
       LOCATION DROPDOWN
       ============================================================ */

  function setupLocationSelect(selectWrapper) {
    const select = selectWrapper.querySelector("select");

    if (!select) {
      return;
    }

    if (select.dataset.customLocationReady === "true") {
      return;
    }

    select.dataset.customLocationReady = "true";

    select.style.display = "none";

    /* ---------------- TRIGGER ---------------- */

    const trigger = document.createElement("button");

    trigger.type = "button";
    trigger.className = "select-trigger location-trigger";

    const triggerText = document.createElement("span");

    triggerText.className = "select-trigger-text";

    const triggerIcon = document.createElement("i");

    triggerIcon.className = "fa-solid fa-chevron-down select-trigger-icon";

    trigger.appendChild(triggerText);
    trigger.appendChild(triggerIcon);

    /* ---------------- MENU ---------------- */

    const menu = document.createElement("div");

    menu.className = "select-menu location-menu";

    /* ---------------- SEARCH ---------------- */

    const searchContainer = document.createElement("div");

    searchContainer.className = "location-search-container";

    searchContainer.innerHTML = `
            <i class="fa-solid fa-magnifying-glass"></i>

            <input
                type="search"
                class="location-api-search"
                placeholder="Search locations..."
                autocomplete="off"
            >
        `;

    menu.appendChild(searchContainer);

    const locationContent = document.createElement("div");

    locationContent.className = "location-menu-content";

    menu.appendChild(locationContent);

    selectWrapper.appendChild(trigger);
    selectWrapper.appendChild(menu);

    selectWrapper.classList.add("custom-select", "location-select");

    /* ========================================================
           SELECT LOCATION
           ======================================================== */

    function selectLocation(value, label) {
      select.value = value;

      triggerText.textContent = label;

      dispatchChange(select);

      selectWrapper.classList.remove("is-open");
    }

    /* ========================================================
           RENDER CUSTOM LOCATIONS
           ======================================================== */

    function renderCustomLocations() {
      const header = document.createElement("div");

      header.className = "location-group-title";

      header.innerHTML = `
                <span>CUSTOM LOCATIONS</span>
                <span class="location-group-emoji">
                    📍
                </span>
            `;

      locationContent.appendChild(header);

      CUSTOM_OPTIONS.locations.forEach((location) => {
        const button = document.createElement("button");

        button.type = "button";

        button.className = "location-option custom-location-option";

        if (select.value === location) {
          button.classList.add("selected");
        }

        button.innerHTML = `
                        <span class="location-option-icon">

                            <i class="fa-solid fa-location-dot"></i>

                        </span>

                        <span class="location-option-text">

                            <strong>
                                ${escapeHtml(location)}
                            </strong>

                            <small>
                                Custom Location
                            </small>

                        </span>

                        <i class="fa-solid fa-check location-check"></i>
                    `;

        button.addEventListener("click", () => {
          selectLocation(location, location);
        });

        locationContent.appendChild(button);
      });
    }

    /* ========================================================
           RENDER BASE
           ======================================================== */

    function renderBase() {
      locationContent.innerHTML = "";

      /* ---------------- ALL LOCATIONS ---------------- */

      const allButton = document.createElement("button");

      allButton.type = "button";

      allButton.className = "location-option location-all-option";

      if (!select.value || select.value === "all") {
        allButton.classList.add("selected");

        triggerText.textContent = "All Locations";
      }

      allButton.innerHTML = `
                <span class="location-option-icon">

                    <i class="fa-solid fa-globe"></i>

                </span>

                <span class="location-option-text">

                    <strong>
                        All Locations
                    </strong>

                    <small>
                        Search everywhere
                    </small>

                </span>

                <i class="fa-solid fa-check location-check"></i>
            `;

      allButton.addEventListener("click", () => {
        selectLocation("all", "All Locations");
      });

      locationContent.appendChild(allButton);

      /* ---------------- CUSTOM LOCATIONS ---------------- */

      renderCustomLocations();

      /* ---------------- REMOTE ---------------- */

      const remoteHeader = document.createElement("div");

      remoteHeader.className = "location-group-title";

      remoteHeader.innerHTML = `
                <span>GLOBAL / REMOTE</span>

                <span class="location-group-emoji">
                    🌐
                </span>
            `;

      locationContent.appendChild(remoteHeader);

      const remoteButton = document.createElement("button");

      remoteButton.type = "button";

      remoteButton.className = "location-option";

      if (select.value === "Remote") {
        remoteButton.classList.add("selected");

        triggerText.textContent = "Remote";
      }

      remoteButton.innerHTML = `
                <span class="location-option-icon remote-icon">

                    <i class="fa-solid fa-house-laptop"></i>

                </span>

                <span class="location-option-text">

                    <strong>
                        Remote
                    </strong>

                    <small>
                        Work from anywhere
                    </small>

                </span>

                <i class="fa-solid fa-check location-check"></i>
            `;

      remoteButton.addEventListener("click", () => {
        selectLocation("Remote", "Remote");
      });

      locationContent.appendChild(remoteButton);

      /* ---------------- COUNTRIES ---------------- */

      const countryHeader = document.createElement("div");

      countryHeader.className = "location-group-title country-header";

      countryHeader.innerHTML = `
                <span>COUNTRIES</span>

                <span class="location-group-emoji">
                    🌍
                </span>
            `;

      locationContent.appendChild(countryHeader);

      if (!state.countriesLoaded) {
        const loading = document.createElement("div");

        loading.className = "location-loading";

        loading.innerHTML = `
                    <i class="fa-solid fa-spinner fa-spin"></i>

                    <span>
                        Loading countries...
                    </span>
                `;

        locationContent.appendChild(loading);

        loadCountries().then(() => {
          renderCountries();
        });
      } else {
        renderCountries();
      }
    }

    /* ========================================================
           RENDER COUNTRIES
           ======================================================== */

    function renderCountries() {
      locationContent
        .querySelectorAll(".country-option, .country-cities")
        .forEach((element) => {
          element.remove();
        });

      const countries = state.countries || [];

      countries.forEach((country) => {
        if (!country.name) {
          return;
        }

        const countryButton = document.createElement("button");

        countryButton.type = "button";

        countryButton.className = "location-option country-option";

        const flag = country.flag || "🌍";

        countryButton.innerHTML = `
                    <span class="country-flag">

                        ${escapeHtml(flag)}

                    </span>

                    <span class="location-option-text">

                        <strong>
                            ${escapeHtml(country.name)}
                        </strong>

                        <small>
                            ${escapeHtml(country.region || "Location")}
                        </small>

                    </span>

                    <i class="fa-solid fa-chevron-right country-chevron"></i>
                `;

        const cityContainer = document.createElement("div");

        cityContainer.className = "country-cities";

        countryButton.addEventListener("click", async (event) => {
          event.preventDefault();

          const isOpen = cityContainer.classList.contains("is-open");

          locationContent
            .querySelectorAll(".country-cities.is-open")
            .forEach((element) => {
              element.classList.remove("is-open");
            });

          locationContent
            .querySelectorAll(".country-option.expanded")
            .forEach((element) => {
              element.classList.remove("expanded");
            });

          if (isOpen) {
            return;
          }

          cityContainer.classList.add("is-open");

          countryButton.classList.add("expanded");

          cityContainer.innerHTML = `
                            <div class="location-loading city-loading">

                                <i class="fa-solid fa-spinner fa-spin"></i>

                                <span>
                                    Loading cities...
                                </span>

                            </div>
                        `;

          const cities = await loadCities(country.alpha2Code);

          renderCities(cityContainer, cities, country);
        });

        locationContent.appendChild(countryButton);

        locationContent.appendChild(cityContainer);
      });
    }

    /* ========================================================
           RENDER CITIES
           ======================================================== */

    function renderCities(container, cities, country) {
      container.innerHTML = "";

      if (!cities.length) {
        container.innerHTML = `
                    <div class="location-no-results">

                        <i class="fa-solid fa-city"></i>

                        <span>
                            No cities available
                        </span>

                    </div>
                `;

        return;
      }

      cities.forEach((city) => {
        if (!city.name) {
          return;
        }

        const cityButton = document.createElement("button");

        cityButton.type = "button";

        cityButton.className = "location-option city-option";

        const displayName = `${city.name}, ${country.name}`;

        cityButton.innerHTML = `
                    <span class="city-option-icon">

                        <i class="fa-solid fa-location-dot"></i>

                    </span>

                    <span class="location-option-text">

                        <strong>
                            ${escapeHtml(city.name)}
                        </strong>

                        <small>
                            ${escapeHtml(country.name)}
                        </small>

                    </span>

                    <i class="fa-solid fa-check location-check"></i>
                `;

        if (select.value === city.name) {
          cityButton.classList.add("selected");
        }

        cityButton.addEventListener("click", () => {
          select.value = city.name;

          triggerText.textContent = displayName;

          dispatchChange(select);

          selectWrapper.classList.remove("is-open");
        });

        container.appendChild(cityButton);
      });
    }

    /* ========================================================
           LOCATION SEARCH
           ======================================================== */

    const locationSearch = searchContainer.querySelector(
      ".location-api-search",
    );

    const performLocationSearch = debounce(async () => {
      const query = locationSearch.value.trim();

      if (!query) {
        renderBase();

        return;
      }

      locationContent.innerHTML = `
                        <div class="location-loading">

                            <i class="fa-solid fa-spinner fa-spin"></i>

                            <span>
                                Searching locations...
                            </span>

                        </div>
                    `;

      /* Search custom locations first */

      const customMatches = CUSTOM_OPTIONS.locations.filter((location) =>
        location.toLowerCase().includes(query.toLowerCase()),
      );

      const cities = await searchCities(query);

      locationContent.innerHTML = "";

      /* ---------------- CUSTOM RESULTS ---------------- */

      if (customMatches.length) {
        const header = document.createElement("div");

        header.className = "location-search-result-title";

        header.textContent = "Custom Locations";

        locationContent.appendChild(header);

        customMatches.forEach((location) => {
          const button = document.createElement("button");

          button.type = "button";

          button.className = "location-option city-search-result";

          button.innerHTML = `
                                    <span class="city-option-icon">

                                        <i class="fa-solid fa-location-dot"></i>

                                    </span>

                                    <span class="location-option-text">

                                        <strong>
                                            ${escapeHtml(location)}
                                        </strong>

                                        <small>
                                            Custom Location
                                        </small>

                                    </span>

                                    <i class="fa-solid fa-check location-check"></i>
                                `;

          button.addEventListener("click", () => {
            select.value = location;

            triggerText.textContent = location;

            dispatchChange(select);

            selectWrapper.classList.remove("is-open");
          });

          locationContent.appendChild(button);
        });
      }

      /* ---------------- API RESULTS ---------------- */

      if (cities.length) {
        const header = document.createElement("div");

        header.className = "location-search-result-title";

        header.textContent = `Locations matching "${query}"`;

        locationContent.appendChild(header);

        cities.forEach((city) => {
          const button = document.createElement("button");

          button.type = "button";

          button.className = "location-option city-search-result";

          const country = state.countries.find(
            (item) => item.alpha2Code === city.countryCode,
          );

          const countryName = country
            ? country.name
            : city.countryCode || "Location";

          const flag = country ? country.flag : "🌍";

          button.innerHTML = `
                                <span class="country-flag">

                                    ${escapeHtml(flag)}

                                </span>

                                <span class="location-option-text">

                                    <strong>
                                        ${escapeHtml(city.name)}
                                    </strong>

                                    <small>
                                        ${escapeHtml(countryName)}
                                    </small>

                                </span>

                                <i class="fa-solid fa-check location-check"></i>
                            `;

          button.addEventListener("click", () => {
            select.value = city.name;

            triggerText.textContent = `${city.name}, ${countryName}`;

            dispatchChange(select);

            selectWrapper.classList.remove("is-open");
          });

          locationContent.appendChild(button);
        });
      }

      if (!customMatches.length && !cities.length) {
        locationContent.innerHTML = `
                            <div class="location-no-results">

                                <i class="fa-solid fa-location-dot"></i>

                                <strong>
                                    No locations found
                                </strong>

                                <small>
                                    Try another city or country
                                </small>

                            </div>
                        `;
      }
    }, CONFIG.searchDebounce);

    locationSearch.addEventListener("input", performLocationSearch);

    locationSearch.addEventListener("keydown", (event) => {
      if (event.key === "Escape") {
        selectWrapper.classList.remove("is-open");

        locationSearch.blur();
      }
    });

    /* ========================================================
           OPEN LOCATION DROPDOWN
           ======================================================== */

    trigger.addEventListener("click", (event) => {
      event.stopPropagation();

      closeAll(selectWrapper);

      const willOpen = !selectWrapper.classList.contains("is-open");

      selectWrapper.classList.toggle("is-open", willOpen);

      if (!willOpen) {
        return;
      }

      setTimeout(() => {
        locationSearch.focus();
      }, 50);

      if (!locationSearch.value.trim()) {
        renderBase();
      }
    });

    /* ========================================================
           INITIAL VALUE
           ======================================================== */

    const selected = select.options[select.selectedIndex];

    if (selected && selected.value && selected.value !== "all") {
      triggerText.textContent = selected.textContent;
    } else {
      triggerText.textContent = "All Locations";
    }

    renderBase();
  }

  /* ============================================================
       COMPANY API
       ============================================================ */

  async function loadCompanies() {
    if (state.companiesLoaded) {
      return state.companies;
    }

    if (state.companiesLoading) {
      return CUSTOM_OPTIONS.companies;
    }

    state.companiesLoading = true;

    try {
      const url =
        `${CONFIG.companiesApi}` +
        `?limit=${CONFIG.companiesLimit}` +
        `&offset=0`;

      const response = await fetch(url);

      if (!response.ok) {
        throw new Error(`Companies API failed: ${response.status}`);
      }

      const json = await response.json();

      const data = Array.isArray(json.data) ? json.data : [];

      const apiCompanies = data
        .filter((company) => company && company.name)
        .map((company) => company.name);

      state.companies = uniqueArray([
        ...CUSTOM_OPTIONS.companies,
        ...apiCompanies,
      ]);

      state.companiesLoaded = true;
    } catch (error) {
      console.error("SMARTHIRE: Unable to load companies.", error);

      state.companies = CUSTOM_OPTIONS.companies.slice();
    } finally {
      state.companiesLoading = false;
    }

    return state.companies;
  }

  async function searchCompanies(query) {
    if (!query) {
      return loadCompanies();
    }

    try {
      const url =
        `${CONFIG.companiesApi}` +
        `?q=${encodeURIComponent(query)}` +
        `&limit=50`;

      const response = await fetch(url);

      if (!response.ok) {
        throw new Error(`Company search failed: ${response.status}`);
      }

      const json = await response.json();

      const data = Array.isArray(json.data) ? json.data : [];

      const apiCompanies = data
        .filter((company) => company && company.name)
        .map((company) => company.name);

      const customCompanies = CUSTOM_OPTIONS.companies.filter((company) =>
        company.toLowerCase().includes(query.toLowerCase()),
      );

      return uniqueArray([...customCompanies, ...apiCompanies]);
    } catch (error) {
      console.error("SMARTHIRE: Company search failed.", error);

      return CUSTOM_OPTIONS.companies.filter((company) =>
        company.toLowerCase().includes(query.toLowerCase()),
      );
    }
  }

  /* ============================================================
       COMPANY DROPDOWN
       ============================================================ */

  function setupCompanySelect(selectWrapper) {
    const select = selectWrapper.querySelector("select");

    if (!select) {
      return;
    }

    if (select.dataset.customCompanyReady === "true") {
      return;
    }

    select.dataset.customCompanyReady = "true";

    select.style.display = "none";

    /* ---------------- TRIGGER ---------------- */

    const trigger = document.createElement("button");

    trigger.type = "button";

    trigger.className = "select-trigger company-trigger";

    const triggerText = document.createElement("span");

    triggerText.className = "select-trigger-text";

    const triggerIcon = document.createElement("i");

    triggerIcon.className = "fa-solid fa-chevron-down select-trigger-icon";

    trigger.appendChild(triggerText);
    trigger.appendChild(triggerIcon);

    /* ---------------- MENU ---------------- */

    const menu = document.createElement("div");

    menu.className = "select-menu company-menu";

    /* ---------------- SEARCH ---------------- */

    const searchContainer = document.createElement("div");

    searchContainer.className = "company-search-container";

    searchContainer.innerHTML = `
            <i class="fa-solid fa-magnifying-glass"></i>

            <input
                type="search"
                class="company-api-search"
                placeholder="Search companies..."
                autocomplete="off"
            >
        `;

    menu.appendChild(searchContainer);

    const content = document.createElement("div");

    content.className = "company-menu-content";

    menu.appendChild(content);

    selectWrapper.appendChild(trigger);
    selectWrapper.appendChild(menu);

    selectWrapper.classList.add("custom-select", "company-select");

    /* ========================================================
           CREATE COMPANY OPTION
           ======================================================== */

    function createCompanyOption(companyName) {
      const button = document.createElement("button");

      button.type = "button";

      button.className = "select-option company-option";

      button.dataset.value = companyName;

      if (select.value === companyName) {
        button.classList.add("selected");
      }

      button.innerHTML = `
                <span class="company-option-icon">

                    <i class="fa-solid fa-building"></i>

                </span>

                <span class="company-option-name">

                    ${escapeHtml(companyName)}

                </span>

                <i class="fa-solid fa-check location-check"></i>
            `;

      button.addEventListener("click", () => {
        select.value = companyName;

        triggerText.textContent = companyName;

        dispatchChange(select);

        selectWrapper.classList.remove("is-open");
      });

      return button;
    }

    /* ========================================================
           RENDER COMPANIES
           ======================================================== */

    function renderCompanies(companies) {
      content.innerHTML = "";

      /* ---------------- ALL COMPANIES ---------------- */

      const allButton = document.createElement("button");

      allButton.type = "button";

      allButton.className = "select-option company-option";

      if (!select.value || select.value === "all") {
        allButton.classList.add("selected");

        triggerText.textContent = "All Companies";
      }

      allButton.innerHTML = `
                <span class="company-option-icon">

                    <i class="fa-solid fa-building"></i>

                </span>

                <span class="company-option-name">

                    All Companies

                </span>

                <i class="fa-solid fa-check location-check"></i>
            `;

      allButton.addEventListener("click", () => {
        select.value = "all";

        triggerText.textContent = "All Companies";

        dispatchChange(select);

        selectWrapper.classList.remove("is-open");
      });

      content.appendChild(allButton);

      /* ---------------- COMPANIES ---------------- */

      companies.forEach((company) => {
        content.appendChild(createCompanyOption(company));
      });
    }

    /* ========================================================
           COMPANY SEARCH
           ======================================================== */

    const companySearch = searchContainer.querySelector(".company-api-search");

    const performCompanySearch = debounce(async () => {
      const query = companySearch.value.trim();

      content.innerHTML = `
                        <div class="location-loading">

                            <i class="fa-solid fa-spinner fa-spin"></i>

                            <span>
                                Searching companies...
                            </span>

                        </div>
                    `;

      const companies = await searchCompanies(query);

      if (!companies.length) {
        content.innerHTML = `
                            <div class="location-no-results">

                                <i class="fa-solid fa-building"></i>

                                <strong>
                                    No companies found
                                </strong>

                                <small>
                                    Try another company name
                                </small>

                            </div>
                        `;

        return;
      }

      renderCompanies(companies);
    }, CONFIG.searchDebounce);

    companySearch.addEventListener("input", performCompanySearch);

    companySearch.addEventListener("keydown", (event) => {
      if (event.key === "Escape") {
        selectWrapper.classList.remove("is-open");

        companySearch.blur();
      }
    });

    /* ========================================================
           OPEN COMPANY DROPDOWN
           ======================================================== */

    trigger.addEventListener("click", async (event) => {
      event.stopPropagation();

      closeAll(selectWrapper);

      const willOpen = !selectWrapper.classList.contains("is-open");

      selectWrapper.classList.toggle("is-open", willOpen);

      if (!willOpen) {
        return;
      }

      setTimeout(() => {
        companySearch.focus();
      }, 50);

      content.innerHTML = `
                    <div class="location-loading">

                        <i class="fa-solid fa-spinner fa-spin"></i>

                        <span>
                            Loading companies...
                        </span>

                    </div>
                `;

      const companies = await loadCompanies();

      renderCompanies(companies);
    });

    /* ========================================================
           INITIAL VALUE
           ======================================================== */

    const selected = select.options[select.selectedIndex];

    if (selected && selected.value && selected.value !== "all") {
      triggerText.textContent = selected.textContent;
    } else {
      triggerText.textContent = "All Companies";
    }
  }

  /* ============================================================
       NORMAL CUSTOM SELECT
       
       Experience + Date Posted
       ============================================================ */

  function setupNormalSelect(selectWrapper) {
    const select = selectWrapper.querySelector("select");

    if (!select) {
      return;
    }

    if (select.dataset.customNormalReady === "true") {
      return;
    }

    select.dataset.customNormalReady = "true";

    select.style.display = "none";

    /* ---------------- TRIGGER ---------------- */

    const trigger = document.createElement("button");

    trigger.type = "button";

    trigger.className = "select-trigger";

    const triggerText = document.createElement("span");

    triggerText.className = "select-trigger-text";

    const triggerIcon = document.createElement("i");

    triggerIcon.className = "fa-solid fa-chevron-down select-trigger-icon";

    trigger.appendChild(triggerText);

    trigger.appendChild(triggerIcon);

    /* ---------------- MENU ---------------- */

    const menu = document.createElement("div");

    menu.className = "select-menu";

    /* ========================================================
           CONVERT EVERY ORIGINAL OPTION
           INTO CUSTOM BUTTON
           ======================================================== */

    Array.from(select.options).forEach((option) => {
      const button = document.createElement("button");

      button.type = "button";

      button.className = "select-option";

      button.textContent = option.textContent;

      button.dataset.value = option.value;

      if (option.value === select.value) {
        button.classList.add("selected");
      }

      button.addEventListener("click", () => {
        select.value = option.value;

        triggerText.textContent = option.textContent;

        menu.querySelectorAll(".select-option").forEach((item) => {
          item.classList.remove("selected");
        });

        button.classList.add("selected");

        dispatchChange(select);

        selectWrapper.classList.remove("is-open");
      });

      menu.appendChild(button);
    });

    selectWrapper.appendChild(trigger);

    selectWrapper.appendChild(menu);

    selectWrapper.classList.add("custom-select");

    /* ========================================================
           INITIAL TEXT
           ======================================================== */

    const selected = select.options[select.selectedIndex];

    triggerText.textContent = selected ? selected.textContent : "";

    /* ========================================================
           OPEN / CLOSE
           ======================================================== */

    trigger.addEventListener("click", (event) => {
      event.stopPropagation();

      closeAll(selectWrapper);

      selectWrapper.classList.toggle("is-open");
    });
  }

  /* ============================================================
       SELECT DETECTION
       ============================================================ */

  function setupSelect(selectWrapper) {
    const select = selectWrapper.querySelector("select");

    if (!select) {
      return;
    }

    const name = (select.name || "").toLowerCase();

    const id = (select.id || "").toLowerCase();

    /* ---------------- LOCATION ---------------- */

    if (name === "location" || id.includes("location")) {
      setupLocationSelect(selectWrapper);

      return;
    }

    /* ---------------- COMPANY ---------------- */

    if (name === "company" || id.includes("company")) {
      setupCompanySelect(selectWrapper);

      return;
    }

    /* ---------------- EXPERIENCE ---------------- */

    if (name === "experience" || id.includes("experience")) {
      setupNormalSelect(selectWrapper);

      return;
    }

    /* ---------------- POSTED ---------------- */

    if (name === "posted" || id.includes("posted")) {
      setupNormalSelect(selectWrapper);

      return;
    }

    /* ---------------- ANY OTHER SELECT ---------------- */

    setupNormalSelect(selectWrapper);
  }

  /* ============================================================
       GLOBAL CLICK HANDLER
       ============================================================ */

  function setupGlobalClickHandler() {
    document.addEventListener("click", (event) => {
      if (!event.target.closest(".smart-search")) {
        document.querySelectorAll(".smart-search.is-open").forEach((box) => {
          box.classList.remove("is-open");
        });
      }

      if (!event.target.closest(".search-select")) {
        document.querySelectorAll(".search-select.is-open").forEach((box) => {
          box.classList.remove("is-open");
        });
      }
    });
  }

  /* ============================================================
       KEYBOARD HANDLING
       ============================================================ */

  function setupKeyboardHandling() {
    document.addEventListener("keydown", (event) => {
      if (event.key !== "Escape") {
        return;
      }

      document
        .querySelectorAll(".smart-search.is-open, .search-select.is-open")
        .forEach((element) => {
          element.classList.remove("is-open");
        });
    });
  }

  /* ============================================================
       INITIALIZATION
       ============================================================ */

  function initialize() {
    /* ---------------- JOB ROLE ---------------- */

    document
      .querySelectorAll("input[data-smart-search]")
      .forEach(setupSmartSearch);

    /* ---------------- ALL SELECTS ---------------- */

    document.querySelectorAll(".search-select").forEach(setupSelect);

    /* ---------------- GLOBAL HANDLERS ---------------- */

    setupGlobalClickHandler();

    setupKeyboardHandling();

    /* ---------------- PRELOAD COUNTRIES ---------------- */

    loadCountries().catch(() => {
      /*
       * Error is already handled
       * inside loadCountries()
       */
    });
  }

  /* ============================================================
       START APPLICATION
       ============================================================ */

  if (document.readyState === "loading") {
    document.addEventListener("DOMContentLoaded", initialize);
  } else {
    initialize();
  }
})();
