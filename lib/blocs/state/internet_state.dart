// Define the abstract base state
abstract class InternetState {}

// Define a state for when the internet status is checking
class InternetChecking extends InternetState {}

// Define a state for when the internet is connected
class InternetConnected extends InternetState {}

// Define a state for when the internet is disconnected
class InternetDisconnected extends InternetState {}
