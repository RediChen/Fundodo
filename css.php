  <!-- Bootstrap CSS v5.2.1 -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />

  <style>
    .cart-icon {
      font-size: 28px;
      text-decoration: none;
      color: darkgray;

      span {
        top: -6px;
        right: -8px;
        font-size: 14px;
        display: flex;
        height: 20px;
        width: 20px;
        border-radius: 50%;
        color: #fff;
        background-color: red;
        align-items: center;
        justify-content: center;

      }
    }

    .favorite-icon {
      background: #eee;
      font-size: 1.4rem;
      right: 10px;
      bottom: 10px;
      width: 2rem;
      height: 2rem;
      display: flex;
      justify-content: center;
      align-items: center;
      border-radius: 50%;
      color: lightskyblue;

      &.active {
        color: lightcoral;
      }
    }

    .ellipsis {
      max-width: 350px;
      white-space: nowrap;
      overflow: hidden;
      text-overflow: ellipsis;

    }

    .hotel-image {
      max-width: 250px;
      max-height: 150px;
      padding: 5px;
    }
  </style>