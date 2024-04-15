     <br> <br> <br> <br>
                </div>

            </div>

        </div>
        <footer>
            <div class="footer">
                <div class="copyright">
                    <div class="container">
                        <div class="row">
                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12">
                                <p>© 2019 Flexed Design by<a href="https://html.design/"> Free Html Template</a></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>

        <div class="overlay"></div>
        <!-- Javascript files-->
        <script src="../Assets/Template/Main/js/jquery.min.js"></script>
        <script src="../Assets/Template/Main/js/popper.min.js"></script>
        <script src="../Assets/Template/Main/js/bootstrap.bundle.min.js"></script>
        <script src="../Assets/Template/Main/js/owl.carousel.min.js"></script>
        <script src="../Assets/Template/Main/js/custom.js"></script>
        <script src="../Assets/Template/Main/js/jquery.mCustomScrollbar.concat.min.js"></script>

        <script src="../Assets/Template/Main/js/jquery-3.0.0.min.js"></script>
        <script type="text/javascript">
            $(document).ready(function() {
                $("#sidebar").mCustomScrollbar({
                    theme: "minimal"
                });

                $('#dismiss, .overlay').on('click', function() {
                    $('#sidebar').removeClass('active');
                    $('.overlay').removeClass('active');
                });

                $('#sidebarCollapse').on('click', function() {
                    $('#sidebar').addClass('active');
                    $('.overlay').addClass('active');
                    $('.collapse.in').toggleClass('in');
                    $('a[aria-expanded=true]').attr('aria-expanded', 'false');
                });
            });
        </script>

        <script>
            // This example adds a marker to indicate the position of Bondi Beach in Sydney,
            // Australia.
            function initMap() {
                var map = new google.maps.Map(document.getElementById('map'), {
                    zoom: 11,
                    center: {
                        lat: 40.645037,
                        lng: -73.880224
                    },
                });

                var image = '../Assets/Template/Main/images/maps-and-flags.png';
                var beachMarker = new google.maps.Marker({
                    position: {
                        lat: 40.645037,
                        lng: -73.880224
                    },
                    map: map,
                    icon: image
                });
            }
        </script>
        <!-- google map js -->
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA8eaHt9Dh5H57Zh0xVTqxVdBFCvFMqFjQ&callback=initMap"></script>
        <!-- end google map js -->

    </body>

</html>