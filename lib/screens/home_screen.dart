import 'package:doctor_booking_app/shared/widgets/avatars/avatars_circle.dart';
import 'package:doctor_booking_app/shared/widgets/bottom_nav_bars/main_nav_bar.dart';
import 'package:doctor_booking_app/shared/widgets/cards/appointment_preview_card.dart';
import 'package:doctor_booking_app/shared/widgets/titles/section_title.dart';
import 'package:flutter/material.dart';
import 'package:models/models.dart';

import '../shared/widgets/list_tiles/doctor_list_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeView();
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    //Create the HomeView UI
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 110,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome',style: textTheme.bodyMedium,),
            SizedBox(height:4.0),
            Text('Pune', style: textTheme.bodyLarge!.copyWith(fontWeight:FontWeight.bold),),
            SizedBox(height: 4.0,),
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: Colors.red,
                ),
                const SizedBox(height: 4.0,),
                Text('Wakad',style: textTheme.bodyMedium,),
                const SizedBox(height: 4.0,),
                Icon(
                  Icons.expand_more,
                  color: Colors.red,
                ),
                ],
            )
          ],
        ),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.notification_add_outlined),
        ),
        const SizedBox(width: 8.0,),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(64.0),
          child: 
          Padding(padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            decoration: InputDecoration(
              hintText: 'Search for doctors...',
              prefixIcon: Icon(Icons.search),
              suffixIcon: Container(
                margin: EdgeInsets.all(4.0),
                padding: EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                  // color: colorScheme.onSurfaceVariant,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Icon(Icons.filter_alt_off_outlined,
                // color: colorScheme.onSurfaceVariant,
                ),
                ),
            ),
          ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8.0),
        child: Column(children: [
          _DoctorCategories(),
          SizedBox(height: 23.0,),
          _MySchedule(),
          SizedBox(height: 24.0,),
          _NearbyDoctors()
        ],
        ),
      ),
      bottomNavigationBar: const MainNavBar(),

    );
  }
}

class _NearbyDoctors extends StatelessWidget {
  const _NearbyDoctors({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(title: 'NearBy Doctors', 
        action: 'See all',
        onPressed: (){},
        ),
        SizedBox(height: 8.0,),
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (context, index) {
            return Divider(
              height: 24.0,
              color: Colors.red,
            );
          },
          itemCount: Doctor.sampleDoctors.length,
          itemBuilder: (context, index) {
            final doctor = Doctor.sampleDoctors[index];
            return DoctorListTile(doctor: doctor);
          },
        ),
      ],
    );
  }
}


class _MySchedule extends StatelessWidget {
  const _MySchedule({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(title: 'My Schedule', 
        action: 'See all',
        onPressed: (){},),
        const AppointmentPreviewCard(),

      ],
    );
  }
}

class _DoctorCategories extends StatelessWidget {
  const _DoctorCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Section title
        SectionTitle(title: 'Categories',
         action: 'See all',
          onPressed: (){}
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: DoctorCategory.values
              .take(5)
              .map(
                (category) => Expanded(
                  child: CircleAvatarWithTextLabel( // "child" was misspelled as "chiled"
                    icon: category.icon,
                    label: category.name,
                  ),
                ),
              )
              .toList(),
          )

        //...
        ///
        ///
        ///
        ///
        ///
        ///
        ///
        ///
      ],
    );
  }
}