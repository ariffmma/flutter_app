import 'package:flutter/material.dart';
import 'package:expansion_tile_group/expansion_tile_group.dart';

class faqList extends StatefulWidget {
  const faqList({super.key});

  @override
  State<faqList> createState() => _faqListState();
}

class _faqListState extends State<faqList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: const Color(0xfff5f6f7),
          child: ExpansionTileItem.outlined(
            title: const Text(
              'How do I register the event?',
              style: TextStyle(
                fontSize: 12,
                fontFamily: 'Instrument_Sans_Regular',
                color: const Color(0xff212529),
                fontWeight: FontWeight.w700,
              ),
            ),
            children: [
              const Text(
                'You can fill out the form manually or sign up to get access. You should check "my ticket" for barcode access to the event. All events (online and offline) only provide access to post-events within this website.',
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'Instrument_Sans_Regular',
                  color: const Color(0xff212529),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        Container(
          color: const Color(0xfff5f6f7),
          child: ExpansionTileItem.outlined(
            title: const Text(
              'Where is I can my certificate?',
              style: TextStyle(
                fontSize: 12,
                fontFamily: 'Instrument_Sans_Regular',
                color: const Color(0xff212529),
                fontWeight: FontWeight.w700,
              ),
            ),
            children: [
              const Text(
                'All documents related to your participation will be uploaded to your profile. Please check regularly to avoid loss or expiration dates.',
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'Instrument_Sans_Regular',
                  color: const Color(0xff212529),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: 10),
        Container(
          color: const Color(0xfff5f6f7),
          child: ExpansionTileItem.outlined(
            title: const Text(
              'How do I purchase tickets for a paid event?',
              style: TextStyle(
                fontSize: 12,
                fontFamily: 'Instrument_Sans_Regular',
                color: const Color(0xff212529),
                fontWeight: FontWeight.w700,
              ),
            ),
            children: [
              const Text(
                "To purchase tickets, simply visit our event page, select the event you're interested in, and choose the type and quantity of tickets you wish to buy. Afterward, proceed to checkout to complete your purchase using a valid payment method.",
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'Instrument_Sans_Regular',
                  color: const Color(0xff212529),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: 10),
        Container(
          color: const Color(0xfff5f6f7),
          child: ExpansionTileItem.outlined(
            title: const Text(
              'Can I purchase tickets on the day of the event?',
              style: TextStyle(
                fontSize: 12,
                fontFamily: 'Instrument_Sans_Regular',
                color: const Color(0xff212529),
                fontWeight: FontWeight.w700,
              ),
            ),
            children: [
              const Text(
                "Yes, tickets may still be available for purchase on the day of the event, depending on availability. However, we recommend purchasing your tickets in advance to ensure you don't miss out on your desired seats.",
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'Instrument_Sans_Regular',
                  color: const Color(0xff212529),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: 10),
        Container(
          color: const Color(0xfff5f6f7),
          child: ExpansionTileItem.outlined(
            title: const Text(
              'Are tickets refundable or transferable?',
              style: TextStyle(
                fontSize: 12,
                fontFamily: 'Instrument_Sans_Regular',
                color: const Color(0xff212529),
                fontWeight: FontWeight.w700,
              ),
            ),
            children: [
              const Text(
                "Tickets are non-refundable, but you may be able to transfer them to someone else. If the event is canceled, you will be issued a full refund. Please refer to our event's cancellation policy for further details.",
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'Instrument_Sans_Regular',
                  color: const Color(0xff212529),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: 10),
        Container(
          color: const Color(0xfff5f6f7),
          child: ExpansionTileItem.outlined(
            title: const Text(
              'Do I need a physical ticket to attend the event?',
              style: TextStyle(
                fontSize: 12,
                fontFamily: 'Instrument_Sans_Regular',
                color: const Color(0xff212529),
                fontWeight: FontWeight.w700,
              ),
            ),
            children: [
              const Text(
                "No, we offer digital tickets sent to your email, or you can access on our website. You can show the digital ticket at the event entry, printed or on your mobile device.",
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'Instrument_Sans_Regular',
                  color: const Color(0xff212529),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: 10),
        Container(
          color: const Color(0xfff5f6f7),
          child: ExpansionTileItem.outlined(
            title: const Text(
              'What do I do if I lose my ticket?',
              style: TextStyle(
                fontSize: 12,
                fontFamily: 'Instrument_Sans_Regular',
                color: const Color(0xff212529),
                fontWeight: FontWeight.w700,
              ),
            ),
            children: [
              const Text(
                "If you lose your ticket, please contact our customer support team immediately. Depending on the event's policies, we can verify your purchase and issue a replacement ticket or find another solution.",
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'Instrument_Sans_Regular',
                  color: const Color(0xff212529),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        Container(
          color: const Color(0xfff5f6f7),
          child: ExpansionTileItem.outlined(
            title: const Text(
              'How do I access my tickets after purchasing?',
              style: TextStyle(
                fontSize: 12,
                fontFamily: 'Instrument_Sans_Regular',
                color: const Color(0xff212529),
                fontWeight: FontWeight.w700,
              ),
            ),
            children: [
              const Text(
                "After completing your purchase, you will receive an email confirmation along with a link to access your digital tickets. You can also view your tickets in your account on our website.",
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'Instrument_Sans_Regular',
                  color: const Color(0xff212529),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
