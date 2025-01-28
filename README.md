# Crispy Bacon Flutter Deals App

A Flutter app for browsing and viewing CheapShark deals. Part of the Crispy Bacon Flutter test.

This Flutter app utilizes the CheapShark Deals API to display a list of gaming deals. The application adheres to **Clean Architecture** and **SOLID principles** to ensure a scalable and maintainable codebase.

---

## Requirements

### **Mandatory Features**

#### **Paginated List of Deals**
- **Displays deals** with the following properties:
  - **Title**
  - **Thumbnail** (if present)
  - **Price**

##### **Implementation Notes**
- The list is **paginated** using the **BLoC pattern** to handle state management effectively.
- **Dio** is used for API requests to fetch paginated data from the CheapShark API.

---

#### **Empty State Handling**
- The app shows a **user-friendly empty state** when no data is available.

##### **Implementation Notes**
- Empty state is dynamically handled through the **UI layer** with error and no-results messaging.

---

### **Optional Features**

#### **Deal Details View**
- On tapping a deal, a **detailed view** is displayed with the following information:
  - **Title**
  - **Thumbnail** (if present)
  - **Price**
  - **Rating**
  - **Release date**
  - **Metacritic link** (external site)

##### **Implementation Notes**
- The detailed view is designed using a **separate BLoC instance** for localized state management.
- **Navigation is implemented** using **Navigator 2.0** to ensure a smooth transition.

---

## Implementation Details

### **Guidelines**

#### **Code Structure and Clarity**
- The app is structured following **Clean Architecture principles**:
  - **Presentation Layer**: Contains UI components managed by the **BLoC pattern**.
  - **Domain Layer**: Encapsulates business logic and use cases.
  - **Data Layer**: Handles data fetching and caching through repositories.

---

#### **State Management**
- **BLoC Library** was used to manage state transitions effectively.
  - **Reason for Choice**: BLoC ensures predictable state management and scalability, aligning well with Clean Architecture.

---

#### **Null Safety**
- The app is implemented with Dart’s **sound null safety feature** to prevent runtime null errors.

---

#### **Dio for Networking**
- **Reason for Choice**: Dio provides robust HTTP client features such as:
  - Request cancellation
  - Interceptors
  - Advanced error handling

---

#### **Documentation**
- Comprehensive documentation is provided, including this **README file**, to explain design decisions and features.

---

### **Bonus Features**

#### **Offline Functionality**

##### **Caching**
- Deals fetched from the API are cached locally.
- Liked deals are stored offline for seamless access.

##### **Implementation Notes**
- Local caching is achieved using **SQLite**.

---

#### **Price Range Filter**

##### **Feature**
- Users can specify a **price range** to filter deals.
- Pagination respects the applied filters, fetching and displaying only relevant results.

##### **Implementation Notes**
- Filtering is handled at the **repository level** to optimize API calls and ensure efficiency.

---

#### **Unit Testing**

##### **Tests**
- **Unit tests** are written for critical use cases and business logic.
- Includes testing for **edge cases** and **failure scenarios**.

##### **Reason for Choice**
- Ensures application reliability and correctness.

---

#### **Custom Native Feature**

##### **Feature**
- A **custom vibrator** was implemented for Android **without using pre-existing Flutter plugins**.

##### **Reason for Choice**
- Demonstrates understanding of **platform-specific integrations** and creativity.

---

## Repository

The project is hosted in a **private GitHub repository** and shared with the appropriate stakeholders.
