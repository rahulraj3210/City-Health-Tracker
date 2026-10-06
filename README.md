# City Health Tracker

A Flutter app (Android + Web) for tracking health across a city laid out as a
grid of blocks and houses. Infected houses are shown in red, and touching
infected houses (3+, including diagonals) are detected and outlined as
**clusters**. Block risk levels and city-wide stats update live from Firestore.

## Features

- Responsive dashboard: headline stats, interactive 6×6 city map, hotspots,
  risk distribution (phone, tablet, desktop)
- Block detail (`/blocks/:blockId`, deep-linkable): house grid with cluster
  outlines and a per-house details sheet
- Edit a house's status (healthy / suspected / infected + severity /
  recovered); clusters, risk, and stats recompute live

## Tech stack

- Flutter (pinned with [FVM](https://fvm.app), see `.fvmrc`)
- `flutter_bloc` (Cubit) + `freezed` for immutable models and unions
- `auto_route` for web/mobile routing
- Firebase: Cloud Firestore

## Architecture

Feature-based modules directly under `lib/` (`core`, `dashboard`,
`health_map`), each with the same layout:

```
lib/<module>/
  blocs/     Cubits and their freezed states
  screens/   Routable pages (@RoutePage)
  service/   Firebase/API services
  models/    Freezed models
  widgets/   UI components for this module
```

`core/` additionally holds app-wide `router/`, `theme/`, `constants/`,
`utils/`, and `firebase/` (generated config).

UI talks only to cubits; cubits talk to services; only
`firestore_city_health_service.dart` touches Firestore.

```
view  ──▶  cubit (CityHealthCubit, HouseStatusCubit)  ──▶  CityHealthService  ──▶  Firestore
```

## Setup

1. Install the pinned Flutter version and dependencies:
   ```bash
   fvm install
   fvm flutter pub get
   ```
2. **Firebase config is not committed.** Generate it for your own Firebase
   project (requires the [Firebase CLI](https://firebase.google.com/docs/cli)
   and `dart pub global activate flutterfire_cli`):
   ```bash
   flutterfire configure --platforms=android,web --out=lib/core/firebase/firebase_options.dart
   ```
   This creates `lib/core/firebase/firebase_options.dart` and
   `android/app/google-services.json`.
3. Create a Firestore database, then deploy the security rules
   (update `.firebaserc` with your project id first):
   ```bash
   firebase deploy --only firestore
   ```
4. Seed the mock city (uses your Firebase CLI login):
   ```bash
   fvm dart run tool/seed_firestore.dart --project <your-project-id>
   ```
5. Run:
   ```bash
   fvm flutter run -d chrome
   ```

## Development

```bash
fvm dart run build_runner build -d   # regenerate freezed / json / routes
fvm flutter test
fvm flutter analyze
```

## Security note

There is no authentication yet. Firestore rules allow public reads and only
one unauthenticated write: updating a house's `status` (validated) with a
server `updatedAt`. Add Firebase Auth before storing real data.
