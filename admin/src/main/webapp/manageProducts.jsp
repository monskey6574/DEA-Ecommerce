<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>

    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
      crossorigin="anonymous"
    />

    <style>
      @import url("https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap");

      * {
        font-family: "Poppins", sans-serif !important;
      }

      li {
        list-style: none;
      }

      a {
        text-decoration: none !important;
      }

      .addBtn:hover {
        box-shadow: 4px 4px 0px #cccccc !important;
        transform: scale(0.98);
      }

      table {
        border-collapse: collapse;
        border-spacing: 0;
        width: 100%;
      }

      th,
      td {
        text-align: center;
        padding: 8px;
        color: #ffffff;
        font-size: 16px;
      }

      .saveBtn:hover {
        box-shadow: 4px 4px 0px #ffffff !important;
        transform: scale(0.98);
      }
    </style>
  </head>

  <body>
    <%@include file="headerAdmin2.html" %>

    <section
      style="width: 100%; background-color: #e7e7e7; padding: 20px 0px 40px 0px"
    >
      <div>
        <p
          style="
            font-size: 40px;
            font-weight: 600;
            color: #203c55;
            text-align: center;
            letter-spacing: 1px;
          "
        >
          ADMIN PANEL
        </p>
        <p
          style="
            font-size: 20px;
            font-weight: 600;
            color: #203c55;
            text-align: center;
            letter-spacing: 7px;
            margin-top: -20px;
            padding-left: 5px;
          "
        >
          BLOOM CLOTHING
        </p>
        <p
          style="
            font-size: 40px;
            font-weight: 600;
            color: #203c55;
            text-align: center;
            letter-spacing: 1px;
          "
        >
          Manage Products
        </p>
      </div>
      <div style="margin-top: 20px">
        <div
          style="
            width: 90%;
            background-color: #203c55;
            box-shadow: 10px 10px 0px #ffffff;
            padding-bottom: 40px;
            margin: auto;
          "
        >
          <style>
            .productLink {
              color: #203c55 !important;
              border-radius: 0 !important;
              font-weight: 600;
            }
          </style>
          <ul class="nav nav-fill nav-tabs" role="tablist">
            <li
              class="nav-item"
              role="presentation"
              style="border-radius: 0; background-color: #cccccc; margin: 10px"
            >
              <a
                class="nav-link productLink active"
                id="fill-tab-0"
                data-bs-toggle="tab"
                href="#fill-tabpanel-0"
                role="tab"
                aria-controls="fill-tabpanel-0"
                aria-selected="true"
              >
                MEN'S
              </a>
            </li>
            <li
              class="nav-item"
              role="presentation"
              style="border-radius: 0; background-color: #cccccc; margin: 10px"
            >
              <a
                class="nav-link productLink"
                id="fill-tab-1"
                data-bs-toggle="tab"
                href="#fill-tabpanel-1"
                role="tab"
                aria-controls="fill-tabpanel-1"
                aria-selected="false"
              >
                WOMAN'S
              </a>
            </li>
          </ul>
          <div class="tab-content" id="tab-content">
            <div
              class="tab-pane fade show active"
              id="fill-tabpanel-0"
              role="tabpanel"
              aria-labelledby="fill-tab-0"
              style="color: #ffffff"
            >
              <form class="addMen" id="productForm">
                <div style="width: 100%; padding: 20px 20px 20px 20px">
                  <p style="color: #ffffff; font-weight: 600">Product name :</p>
                  <input
                    style="
                      width: 100%;
                      height: 40px;
                      padding: 20px;
                      border: none;
                      font-size: 18px;
                      margin-top: -20px;
                      font-weight: normal;
                    "
                    type="text"
                    name="name"
                    placeholder="Enter product name"
                    id=""
                  />
                </div>
                <div
                  style="
                    width: 100%;
                    margin-top: -20px;
                    padding: 20px 20px 20px 20px;
                    display: flex;
                    justify-content: space-between;
                  "
                >
                  <div style="width: 32%">
                    <p style="color: #ffffff; font-weight: 600">Image 1:</p>
                    <div class="input-group mb-3">
                      <input
                        style="border-radius: 0; margin-top: -10px"
                        type="file"
                        class="form-control"
                        id="productURL1"
                        name="productURL1"
                        placeholder="Enter prodcut URL 1"
                      />
                    </div>
                  </div>
                  <div style="width: 32%">
                    <p style="color: #ffffff; font-weight: 600">Image 2:</p>
                    <div class="input-group mb-3">
                      <input
                        style="border-radius: 0; margin-top: -10px"
                        type="file"
                        class="form-control"
                        id="productURL2"
                        name="productURL2"
                        placeholder="Enter prodcut URL 2"
                      />
                    </div>
                  </div>
                  <div style="width: 32%">
                    <p style="color: #ffffff; font-weight: 600">Image 3:</p>
                    <div class="input-group mb-3">
                      <input
                        style="border-radius: 0; margin-top: -10px"
                        type="file"
                        class="form-control"
                        id="productURL3"
                        name="productURL3"
                        placeholder="Enter prodcut URL 3"
                      />
                    </div>
                  </div>
                </div>
                <div
                  style="
                    margin-top: -40px;
                    width: 100%;
                    padding: 20px 20px 20px 20px;
                  "
                >
                  <p style="color: #ffffff; font-weight: 600">
                    Product description :
                  </p>
                  <input
                    style="
                      width: 100%;
                      height: 40px;
                      padding: 20px;
                      border: none;
                      font-size: 18px;
                      margin-top: -20px;
                      font-weight: normal;
                    "
                    type="text"
                    name="description"
                    placeholder="Enter product description"
                    id=""
                  />
                </div>
                <div
                  style="
                    width: 100%;
                    margin-top: -20px;
                    padding: 20px 20px 0px 20px;
                    display: flex;
                    justify-content: space-between;
                  "
                >
                  <div style="width: 49%">
                    <p style="color: #ffffff; font-weight: 600">
                      Product price :
                    </p>
                    <div class="input-group" style="margin-top: -10px">
                      <span
                        class="input-group-text"
                        style="border-radius: 0 !important"
                        >LKR</span
                      >
                      <input
                        style="border-radius: 0 !important"
                        type="text"
                        class="form-control"
                        name="price"
                        aria-label="Amount (to the nearest dollar)"
                        placeholder="Enter price"
                      />
                      <span
                        class="input-group-text"
                        style="border-radius: 0 !important"
                        >.00</span
                      >
                    </div>
                  </div>
                  <div style="width: 49%">
                    <p style="color: #ffffff; font-weight: 600">Quantity :</p>
                    <div class="input-group mb-3">
                      <input
                        style="border-radius: 0; margin-top: -10px"
                        type="text"
                        class="form-control"
                        id="inputGroupFile01"
                        name="quantity"
                        placeholder="Enter prodcut quantity"
                      />
                    </div>
                  </div>
                </div>
                <div
                  style="
                    width: 100%;
                    margin-top: -20px;
                    padding: 20px 20px 0px 20px;
                    display: flex;
                    justify-content: space-between;
                  "
                >
                  <div style="width: 49%">
                    <p style="color: #ffffff; font-weight: 600">
                      Product size :
                    </p>
                    <div class="input-group" style="margin-top: -10px">
                      <select
                        class="form-select"
                        id="sizeSelect"
                        style="border-radius: 0"
                      >
                        <option selected>Choose size</option>
                        <option value="1">Small</option>
                        <option value="2">Medium</option>
                        <option value="3">Large</option>
                      </select>
                    </div>
                  </div>
                  <div style="width: 49%">
                    <p style="color: #ffffff; font-weight: 600">
                      Product color :
                    </p>
                    <div class="input-group" style="margin-top: -10px">
                      <select
                        class="form-select"
                        id="colorSelect"
                        style="border-radius: 0"
                      >
                        <option selected>Choose color</option>
                        <option value="1" data-hex="#FF0000">Red</option>
                        <option value="2" data-hex="#0000FF">Blue</option>
                        <option value="3" data-hex="#000000">Black</option>
                      </select>
                    </div>
                  </div>
                </div>
                <div
                  style="
                    width: 100%;
                    padding: 20px 20px 0px 20px;
                    display: flex;
                    justify-content: space-between;
                  "
                >
                  <div style="width: 49%">
                    <p style="color: #ffffff; font-weight: 600">
                      Select product tag/s :
                    </p>
                    <div style="padding-left: 20px">
                      <div class="form-check">
                        <input
                          class="form-check-input"
                          type="checkbox"
                          value=""
                          id="flexCheckDefault"
                        />
                        <label class="form-check-label" for="flexCheckDefault">
                          tag 1
                        </label>
                      </div>
                      <div class="form-check">
                        <input
                          class="form-check-input"
                          type="checkbox"
                          value=""
                          id="flexCheckChecked"
                        />
                        <label class="form-check-label" for="flexCheckChecked">
                          tag 2
                        </label>
                      </div>
                      <div class="form-check">
                        <input
                          class="form-check-input"
                          type="checkbox"
                          value=""
                          id="flexCheckChecked"
                        />
                        <label class="form-check-label" for="flexCheckChecked">
                          tag 3
                        </label>
                      </div>
                    </div>
                  </div>
                  <div style="width: 49%">
                    <p style="color: #ffffff; font-weight: 600">
                      Select product set :
                    </p>
                    <div class="input-group" style="margin-top: -10px">
                      <select
                        class="form-select"
                        id="inputGroupSelect01"
                        style="border-radius: 0"
                      >
                        <option selected>Choose a set</option>
                        <option value="1">set 1</option>
                        <option value="2">set 2</option>
                        <option value="3">set 3</option>
                      </select>
                    </div>
                  </div>
                </div>
                <div
                  style="width: 100%; display: flex; justify-content: center"
                >
                  <button
                    type="submit"
                    style="
                      width: 600px;
                      background-color: transparent;
                      border: none;
                    "
                  >
                    <div
                      class="addBtn"
                      style="
                        width: 100%;
                        background-color: #ffffff;
                        margin: auto;
                        margin-top: 40px;
                        box-shadow: 8px 8px 0px #cccccc;
                        transition: 0.4s ease-in-out;
                        padding: 5px;
                      "
                    >
                      <p
                        style="
                          color: #203c55;
                          font-size: 24px;
                          font-weight: 600;
                          text-align: center;
                          margin: auto;
                        "
                      >
                        Add prodcut
                      </p>
                    </div>
                  </button>
                </div>
              </form>

            </div>

            <div
              class="tab-pane fade"
              id="fill-tabpanel-1"
              role="tabpanel"
              aria-labelledby="fill-tab-1"
              style="color: #ffffff"
            >
              <form class="addWomen">
                <div style="width: 100%; padding: 20px 20px 20px 20px">
                  <p style="color: #ffffff; font-weight: 600">Product name :</p>
                  <input
                    style="
                      width: 100%;
                      height: 40px;
                      padding: 20px;
                      border: none;
                      font-size: 18px;
                      margin-top: -20px;
                      font-weight: normal;
                    "
                    type="text"
                    name="name"
                    placeholder="Enter product name"
                    id=""
                  />
                </div>
                <div
                  style="
                    width: 100%;
                    margin-top: -20px;
                    padding: 20px 20px 20px 20px;
                    display: flex;
                    justify-content: space-between;
                  "
                >
                  <div style="width: 32%">
                    <p style="color: #ffffff; font-weight: 600">
                      Image 1 :
                    </p>
                    <div class="input-group mb-3">
                      <input
                        style="border-radius: 0; margin-top: -10px"
                        type="file"
                        class="form-control"
                        name="productURL1"
                        placeholder="Image 1"
                      />
                    </div>
                  </div>
                  <div style="width: 32%">
                    <p style="color: #ffffff; font-weight: 600">
                      Image 2 :
                    </p>
                    <div class="input-group mb-3">
                      <input
                        style="border-radius: 0; margin-top: -10px"
                        type="file"
                        class="form-control"
                        name="productURL2"
                        placeholder="Image 2"
                      />
                    </div>
                  </div>
                  <div style="width: 32%">
                    <p style="color: #ffffff; font-weight: 600">
                      Image 3 :
                    </p>
                    <div class="input-group mb-3">
                      <input
                        style="border-radius: 0; margin-top: -10px"
                        type="file"
                        class="form-control"
                        name="productURL3"
                        placeholder="Image 3"
                      />
                    </div>
                  </div>
                </div>
                <div
                  style="
                    margin-top: -40px;
                    width: 100%;
                    padding: 20px 20px 20px 20px;
                  "
                >
                  <p style="color: #ffffff; font-weight: 600">
                    Product description :
                  </p>
                  <input
                    style="
                      width: 100%;
                      height: 40px;
                      padding: 20px;
                      border: none;
                      font-size: 18px;
                      margin-top: -20px;
                      font-weight: normal;
                    "
                    type="text"
                    name="description"
                    placeholder="Enter product description"
                    id=""
                  />
                </div>
                <div
                  style="
                    width: 100%;
                    margin-top: -20px;
                    padding: 20px 20px 0px 20px;
                    display: flex;
                    justify-content: space-between;
                  "
                >
                  <div style="width: 49%">
                    <p style="color: #ffffff; font-weight: 600">
                      Product price :
                    </p>
                    <div class="input-group" style="margin-top: -10px">
                      <span
                        class="input-group-text"
                        style="border-radius: 0 !important"
                        >LKR</span
                      >
                      <input
                        style="border-radius: 0 !important"
                        type="text"
                        class="form-control"
                        aria-label="Amount (to the nearest dollar)"
                        placeholder="Enter price"
                      />
                      <span
                        class="input-group-text"
                        style="border-radius: 0 !important"
                        >.00</span
                      >
                    </div>
                  </div>
                  <div style="width: 49%">
                    <p style="color: #ffffff; font-weight: 600">Quantity :</p>
                    <div class="input-group mb-3">
                      <input
                        style="border-radius: 0; margin-top: -10px"
                        type="text"
                        class="form-control"
                        id="inputGroupFile01"
                        name="quantity"
                        placeholder="Enter prodcut quantity"
                      />
                    </div>
                  </div>
                </div>
                <div
                  style="
                    width: 100%;
                    margin-top: -20px;
                    padding: 20px 20px 0px 20px;
                    display: flex;
                    justify-content: space-between;
                  "
                >
                  <div style="width: 49%">
                    <p style="color: #ffffff; font-weight: 600">
                      Product size :
                    </p>
                    <div class="input-group" style="margin-top: -10px">
                      <select
                        class="form-select"
                        id="sizeSelect"
                        style="border-radius: 0"
                      >
                        <option selected>Choose size</option>
                        <option value="1">Small</option>
                        <option value="2">Medium</option>
                        <option value="3">Large</option>
                      </select>
                    </div>
                  </div>
                  <div style="width: 49%">
                    <p style="color: #ffffff; font-weight: 600">
                      Product color :
                    </p>
                    <div class="input-group" style="margin-top: -10px">
                      <select
                        class="form-select"
                        id="inputGroupSelect01"
                        style="border-radius: 0"
                      >
                        <option selected>Choose color</option>
                        <option value="1">Red</option>
                        <option value="2">Blue</option>
                        <option value="3">Black</option>
                      </select>
                    </div>
                  </div>
                </div>
                <div
                  style="
                    width: 100%;
                    padding: 20px 20px 0px 20px;
                    display: flex;
                    justify-content: space-between;
                  "
                >
                  <div style="width: 49%">
                    <p style="color: #ffffff; font-weight: 600">
                      Select product tag/s :
                    </p>
                    <div style="padding-left: 20px">
                      <div class="form-check">
                        <input
                          class="form-check-input"
                          type="checkbox"
                          value=""
                          id="flexCheckDefault"
                        />
                        <label class="form-check-label" for="flexCheckDefault">
                          tag 1
                        </label>
                      </div>
                      <div class="form-check">
                        <input
                          class="form-check-input"
                          type="checkbox"
                          value=""
                          id="flexCheckChecked"
                        />
                        <label class="form-check-label" for="flexCheckChecked">
                          tag 2
                        </label>
                      </div>
                      <div class="form-check">
                        <input
                          class="form-check-input"
                          type="checkbox"
                          value=""
                          id="flexCheckChecked"
                        />
                        <label class="form-check-label" for="flexCheckChecked">
                          tag 3
                        </label>
                      </div>
                    </div>
                  </div>
                  <div style="width: 49%">
                    <p style="color: #ffffff; font-weight: 600">
                      Select product set :
                    </p>
                    <div class="input-group" style="margin-top: -10px">
                      <select
                        class="form-select"
                        id="inputGroupSelect01"
                        style="border-radius: 0"
                      >
                        <option selected>Choose a set</option>
                        <option value="1">set 1</option>
                        <option value="2">set 2</option>
                        <option value="3">set 3</option>
                      </select>
                    </div>
                  </div>
                </div>
                <div
                  style="width: 100%; display: flex; justify-content: center"
                >
                  <button
                    type="submit"
                    style="
                      width: 600px;
                      background-color: transparent;
                      border: none;
                    "
                  >
                    <div
                      class="addBtn"
                      style="
                        width: 100%;
                        background-color: #ffffff;
                        margin: auto;
                        margin-top: 40px;
                        box-shadow: 8px 8px 0px #cccccc;
                        transition: 0.4s ease-in-out;
                        padding: 5px;
                      "
                    >
                      <p
                        style="
                          color: #203c55;
                          font-size: 24px;
                          font-weight: 600;
                          text-align: center;
                          margin: auto;
                        "
                      >
                        Add prodcut
                      </p>
                    </div>
                  </button>
                </div>
              </form>

            </div>
          </div>
        </div>
      </div>
    </section>

    <%@include file="footerAdmin.html" %>

    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
      crossorigin="anonymous"
    ></script>
    <script>
      <%@include file="js/manageProducts/index.js" %>
    </script>
    
  </body>
</html>
